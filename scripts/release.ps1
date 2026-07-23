param(
    [Parameter(Mandatory = $true, Position = 0)]
    [ValidateSet('prepare', 'verify', 'publish')]
    [string]$Action,

    [Parameter(Mandatory = $true)]
    [ValidatePattern('^\d+\.\d+\.\d+$')]
    [string]$Version,

    [switch]$Build,
    [switch]$Push,
    [switch]$CreatePR
)

$ErrorActionPreference = 'Stop'

$scriptRoot = $PSScriptRoot
$repoRoot = Split-Path -Parent $scriptRoot
$frameworksRoot = Join-Path $repoRoot 'frameworks'
$versionFile = Join-Path $repoRoot 'VERSION'
$changelogFile = Join-Path $repoRoot 'CHANGELOG.md'
$frameworkManifests = @(
    [pscustomobject]@{
        Lang = 'ko'
        Path = Join-Path (Join-Path (Join-Path $frameworksRoot 'ko') '.cowork') 'upgrade_manifest.md'
        DateField = '날짜'
    },
    [pscustomobject]@{
        Lang = 'en'
        Path = Join-Path (Join-Path (Join-Path $frameworksRoot 'en') '.cowork') 'upgrade_manifest.md'
        DateField = 'Date'
    }
) | Where-Object { Test-Path $_.Path }
$releaseBranch = "release/v$Version"

function Get-CurrentBranch {
    Push-Location $repoRoot
    try {
        return (git branch --show-current).Trim()
    }
    finally {
        Pop-Location
    }
}

function Get-GitStatusLines {
    Push-Location $repoRoot
    try {
        return @(git status --porcelain 2>&1)
    }
    finally {
        Pop-Location
    }
}

function Assert-CleanWorkingTree {
    $status = Get-GitStatusLines
    if ($status) {
        throw "Working tree is not clean.`nDirty files:`n$($status -join [Environment]::NewLine)"
    }
}

function Assert-GhCli {
    if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
        throw "gh CLI not found. Install/authenticate GitHub CLI or run without -CreatePR."
    }
}

function Get-PreviousReleaseVersion {
    param(
        [Parameter(Mandatory = $true)]
        [string]$TargetVersion
    )

    Push-Location $repoRoot
    try {
        $rawTags = @(git tag --list 'v*')
    }
    finally {
        Pop-Location
    }

    $versions = @()
    foreach ($tag in $rawTags) {
        if ($tag -match '^v(\d+\.\d+\.\d+)$') {
            $candidate = $Matches[1]
            if ([version]$candidate -lt [version]$TargetVersion) {
                $versions += $candidate
            }
        }
    }

    $sorted = @($versions | Sort-Object { [version]$_ } -Unique)
    if ($sorted.Count -gt 0) {
        return $sorted[-1]
    }

    return '0.0.0'
}

function Upsert-ManifestTableField {
    param(
        [Parameter(Mandatory = $true)]
        [string]$ManifestText,
        [Parameter(Mandatory = $true)]
        [string]$FieldName,
        [Parameter(Mandatory = $true)]
        [string]$FieldValue
    )

    $pattern = '^\|\s*' + [regex]::Escape($FieldName) + '\s*\|\s*(.+?)\s*\|\s*$'
    if ([regex]::IsMatch($ManifestText, $pattern, [System.Text.RegularExpressions.RegexOptions]::Multiline)) {
        return [regex]::Replace(
            $ManifestText,
            $pattern,
            "| $FieldName | $FieldValue |",
            [System.Text.RegularExpressions.RegexOptions]::Multiline
        )
    }

    $headerTablePattern = '(?m)(^\|[^\r\n]+\|\s*$\r?\n^\|[-| ]+\|\s*[-| ]+\|\s*$)'
    if (-not [regex]::IsMatch($ManifestText, $headerTablePattern)) {
        throw "Could not find manifest version table to insert field '$FieldName'."
    }

    # Replace only the FIRST header table (the version-info table).
    # NOTE: the static [regex]::Replace(input, pattern, evaluator, <int>) overload
    # interprets the trailing int as RegexOptions (1 = IgnoreCase), NOT a match
    # count — so it would insert the row into EVERY table in the file. Use the
    # instance .Replace(input, evaluator, count) overload to limit to one.
    $tableRegex = [regex]::new($headerTablePattern)
    $evaluator = [System.Text.RegularExpressions.MatchEvaluator]{
        param($match)
        $match.Value + "`r`n| $FieldName | $FieldValue |"
    }
    return $tableRegex.Replace($ManifestText, $evaluator, 1)
}

function Get-ManifestTableField {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path,
        [Parameter(Mandatory = $true)]
        [string]$FieldName
    )

    $line = Select-String -Path $Path -Pattern ('^\|\s*' + [regex]::Escape($FieldName) + '\s*\|\s*(.+?)\s*\|$') | Select-Object -First 1
    if (-not $line) {
        return $null
    }

    return $line.Matches[0].Groups[1].Value.Trim()
}

function Update-ManifestHeader {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path,
        [Parameter(Mandatory = $true)]
        [string]$VersionValue,
        [Parameter(Mandatory = $true)]
        [string]$FromVersionValue,
        [Parameter(Mandatory = $true)]
        [string]$DateFieldName
    )

    $bytes = [System.IO.File]::ReadAllBytes($Path)
    $hasUtf8Bom = ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF)
    $text = [System.Text.Encoding]::UTF8.GetString($bytes)
    if ($text.Length -gt 0 -and [int][char]$text[0] -eq 0xFEFF) {
        $text = $text.Substring(1)
    }

    $updated = Upsert-ManifestTableField -ManifestText $text -FieldName 'Version' -FieldValue $VersionValue
    $updated = Upsert-ManifestTableField -ManifestText $updated -FieldName 'From' -FieldValue $FromVersionValue
    $updated = Upsert-ManifestTableField -ManifestText $updated -FieldName $DateFieldName -FieldValue ((Get-Date).ToString('yyyy-MM-dd'))

    $normalized = $updated.TrimEnd("`r", "`n") + "`r`n"
    $encoding = New-Object System.Text.UTF8Encoding($hasUtf8Bom)
    [System.IO.File]::WriteAllText($Path, $normalized, $encoding)
}

function Invoke-Verify {
    param(
        [Parameter(Mandatory = $true)]
        [string]$VersionValue,
        [switch]$ShouldBuild
    )

    Write-Host "Verify: VERSION matches $VersionValue"
    if (-not (Test-Path $versionFile)) {
        throw "VERSION file not found: $versionFile"
    }

    $currentVersion = (Get-Content $versionFile -Raw).Trim()
    if ($currentVersion -ne $VersionValue) {
        throw "VERSION file ($currentVersion) does not match expected version ($VersionValue)."
    }

    if (-not $frameworkManifests) {
        throw 'No framework manifests found.'
    }

    foreach ($manifest in $frameworkManifests) {
        Write-Host "Verify: framework manifest ($($manifest.Lang))"

        $manifestVersion = Get-ManifestTableField -Path $manifest.Path -FieldName 'Version'
        if (-not $manifestVersion) {
            throw "Could not find Version field in $($manifest.Path)"
        }
        if ($manifestVersion -ne $VersionValue) {
            throw "$($manifest.Path) version ($manifestVersion) does not match expected version ($VersionValue)."
        }

        $fromVersion = Get-ManifestTableField -Path $manifest.Path -FieldName 'From'
        if (-not $fromVersion) {
            throw "Could not find From field in $($manifest.Path)"
        }
        if ($fromVersion -notmatch '^\d+\.\d+\.\d+$') {
            throw "From field is not a semantic version in $($manifest.Path): $fromVersion"
        }
        if ([version]$fromVersion -ge [version]$manifestVersion) {
            throw "From version ($fromVersion) must be lower than Version ($manifestVersion) in $($manifest.Path)."
        }
    }

    Write-Host 'Verify: cumulative block'
    foreach ($manifest in $frameworkManifests) {
        & (Join-Path $scriptRoot 'update-manifest-cumulative.ps1') -Lang $manifest.Lang -TargetVersion $VersionValue -Check
    }

    Write-Host 'Verify: CHANGELOG entry'
    if (-not (Test-Path $changelogFile)) {
        throw "CHANGELOG.md not found: $changelogFile"
    }
    $changelogEntry = Select-String -Path $changelogFile -Pattern "^\#\#\s*\[$([regex]::Escape($VersionValue))\]" | Select-Object -First 1
    if (-not $changelogEntry) {
        throw "CHANGELOG.md does not contain an entry for version [$VersionValue]."
    }

    Write-Host 'Verify: framework root'
    foreach ($manifest in $frameworkManifests) {
        & (Join-Path $scriptRoot 'validate-template.ps1') -Lang $manifest.Lang
    }

    if ($ShouldBuild) {
        foreach ($manifest in $frameworkManifests) {
            Write-Host "Verify: build $($manifest.Lang) archive"
            & (Join-Path $scriptRoot 'build-template.ps1') -Lang $manifest.Lang
        }
    }
}

function Invoke-Prepare {
    param(
        [Parameter(Mandatory = $true)]
        [string]$VersionValue,
        [switch]$ShouldBuild,
        [switch]$ShouldPush,
        [switch]$ShouldCreatePR
    )

    $currentBranch = Get-CurrentBranch
    if (-not $currentBranch) {
        throw 'Could not determine current git branch.'
    }

    if ($currentBranch -eq 'main') {
        Write-Host "Prepare: current branch is main, creating $releaseBranch"
        Push-Location $repoRoot
        try {
            git checkout -b $releaseBranch | Out-Null
        }
        finally {
            Pop-Location
        }
        $currentBranch = $releaseBranch
    }
    else {
        Write-Host "Prepare: using current branch $currentBranch"
    }

    $previousVersion = Get-PreviousReleaseVersion -TargetVersion $VersionValue
    # Write VERSION as BOM-less UTF-8 with LF. WinPS 5.1's `Set-Content -Encoding utf8`
    # prepends a BOM, which shows up as spurious churn; pin the encoding explicitly.
    [System.IO.File]::WriteAllText($versionFile, "$VersionValue`n", (New-Object System.Text.UTF8Encoding($false)))
    foreach ($manifest in $frameworkManifests) {
        Update-ManifestHeader -Path $manifest.Path -VersionValue $VersionValue -FromVersionValue $previousVersion -DateFieldName $manifest.DateField
        & (Join-Path $scriptRoot 'update-manifest-cumulative.ps1') -Lang $manifest.Lang -TargetVersion $VersionValue
    }

    Invoke-Verify -VersionValue $VersionValue -ShouldBuild:$ShouldBuild

    if ($ShouldPush) {
        Push-Location $repoRoot
        try {
            git push -u origin $currentBranch
        }
        finally {
            Pop-Location
        }
    }

    if ($ShouldCreatePR) {
        Assert-CleanWorkingTree
        Assert-GhCli
        Push-Location $repoRoot
        try {
            $title = "release: v$VersionValue"
            $body = @"
Release preparation for v$VersionValue

- Update framework metadata
- Refresh cumulative manifest block
- Run validation checks
"@
            gh pr create --base main --head $currentBranch --title $title --body $body
        }
        finally {
            Pop-Location
        }
    }

    Write-Host "Prepare completed on branch $currentBranch"
}

function Invoke-Publish {
    param(
        [Parameter(Mandatory = $true)]
        [string]$VersionValue,
        [switch]$ShouldBuild
    )

    $currentBranch = Get-CurrentBranch
    if ($currentBranch -ne 'main') {
        throw "Publish must run from main. Current branch: $currentBranch"
    }

    Assert-CleanWorkingTree
    Invoke-Verify -VersionValue $VersionValue -ShouldBuild:$ShouldBuild

    Push-Location $repoRoot
    try {
        $localTag = @(git tag --list "v$VersionValue")
        if ($localTag) {
            throw "Tag v$VersionValue already exists locally."
        }

        $remoteTag = @(git ls-remote --tags origin "refs/tags/v$VersionValue")
        if ($remoteTag) {
            throw "Tag v$VersionValue already exists on origin."
        }

        git tag -a "v$VersionValue" -m "Framework release v$VersionValue"
        git push origin "refs/tags/v$VersionValue"
    }
    finally {
        Pop-Location
    }

    Write-Host "Publish completed: pushed tag v$VersionValue"
}

if (($Push -or $CreatePR) -and $Action -ne 'prepare') {
    throw '-Push and -CreatePR are only supported with the prepare action.'
}

switch ($Action) {
    'prepare' {
        Invoke-Prepare -VersionValue $Version -ShouldBuild:$Build -ShouldPush:$Push -ShouldCreatePR:$CreatePR
    }
    'verify' {
        Invoke-Verify -VersionValue $Version -ShouldBuild:$Build
        Write-Host "Verify completed for v$Version"
    }
    'publish' {
        Invoke-Publish -VersionValue $Version -ShouldBuild:$Build
    }
}
