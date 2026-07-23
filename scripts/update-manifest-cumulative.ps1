param(
    [ValidateSet('ko', 'en')]
    [string]$Lang = 'ko',

    [ValidatePattern('^\d+\.\d+\.\d+$')]
    [string]$TargetVersion,

    [switch]$DryRun,

    [switch]$Check
)

$ErrorActionPreference = 'Stop'

function Get-VersionFromManifest {
    param(
        [Parameter(Mandatory = $true)]
        [string]$ManifestText
    )

    $match = [regex]::Match($ManifestText, '^\|\s*Version\s*\|\s*(.+?)\s*\|\s*$', 'Multiline')
    if (-not $match.Success) {
        throw "Could not find Version field in upgrade_manifest.md"
    }

    return $match.Groups[1].Value.Trim()
}

function Get-ManifestChangeSummaryBody {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Markdown
    )

    $matches = [regex]::Matches($Markdown, '(?ms)^##\s+(?<title>[^\r\n]+)\r?\n(?<body>.*?)(?=^##\s+|\z)')
    if ($matches.Count -eq 0) {
        return $null
    }

    foreach ($match in $matches) {
        $title = $match.Groups['title'].Value.Trim()
        if ($title -match '^(변경 요약|Change Summary|Summary of Changes)$') {
            return $match.Groups['body'].Value.Trim()
        }
    }

    if ($matches.Count -ge 2) {
        return $matches[1].Groups['body'].Value.Trim()
    }

    return $matches[0].Groups['body'].Value.Trim()
}

function Get-FirstSummaryBullet {
    param(
        [Parameter(Mandatory = $true)]
        [string]$SectionBody
    )

    $lines = $SectionBody -split "`r?`n"
    foreach ($line in $lines) {
        $trimmed = $line.Trim()
        if ($trimmed -match '^[-*]\s+(.+)$') {
            return $Matches[1].Trim()
        }
    }

    $plain = ($lines | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }) -join ' '
    if ($plain) {
        return $plain
    }

    return 'N/A'
}

function Get-ManifestTextFromTag {
    param(
        [Parameter(Mandatory = $true)]
        [string]$RepoRoot,
        [Parameter(Mandatory = $true)]
        [string]$Version,
        [Parameter(Mandatory = $true)]
        [string]$ManifestPath
    )

    $prevEncoding = [Console]::OutputEncoding
    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
    try {
        try {
            $content = git -c i18n.logOutputEncoding=utf-8 -C $RepoRoot show "v$Version`:$ManifestPath" 2>$null
        }
        catch {
            return $null
        }
    }
    finally {
        [Console]::OutputEncoding = $prevEncoding
    }

    if ($LASTEXITCODE -ne 0 -or -not $content) {
        return $null
    }

    return ($content -join "`n")
}

function New-CumulativeBlock {
    param(
        [Parameter(Mandatory = $true)]
        [array]$Rows
    )

    $lines = New-Object System.Collections.Generic.List[string]
    $lines.Add('## Cumulative Change Index (Auto-generated)')
    $lines.Add('')
    $lines.Add('> Auto-updated during release to support sequential upgrades.')
    $lines.Add('')
    $lines.Add('| Version | Key Change Summary |')
    $lines.Add('|---------|--------------------|')

    foreach ($row in $Rows) {
        $summary = $row.Summary -replace '\|', '\|'
        $lines.Add("| $($row.Version) | $summary |")
    }

    return ($lines -join "`r`n")
}

$repoRoot = if ($PSScriptRoot) { Split-Path -Parent $PSScriptRoot } else { (Get-Location).Path }
$frameworkRoot = Join-Path (Join-Path $repoRoot 'frameworks') $Lang
$manifestPath = Join-Path (Join-Path $frameworkRoot '.cowork') 'upgrade_manifest.md'
$manifestPathInRepo = "frameworks/$Lang/.cowork/upgrade_manifest.md"

if (-not (Test-Path $manifestPath)) {
    throw "Manifest file not found: $manifestPath"
}

$manifestBytes = [System.IO.File]::ReadAllBytes($manifestPath)
$hasUtf8Bom = ($manifestBytes.Length -ge 3 -and $manifestBytes[0] -eq 0xEF -and $manifestBytes[1] -eq 0xBB -and $manifestBytes[2] -eq 0xBF)
$manifestText = [System.Text.Encoding]::UTF8.GetString($manifestBytes)
if ($manifestText.Length -gt 0 -and [int][char]$manifestText[0] -eq 0xFEFF) {
    $manifestText = $manifestText.Substring(1)
}

if (-not $TargetVersion) {
    $TargetVersion = Get-VersionFromManifest -ManifestText $manifestText
}

$target = [version]$TargetVersion

$rawTags = git -C $repoRoot tag --list 'v*'
$versions = @()
foreach ($tag in $rawTags) {
    if ($tag -match '^v(\d+\.\d+\.\d+)$') {
        $versions += $Matches[1]
    }
}

$sorted = $versions | Sort-Object { [version]$_ } -Unique
$eligible = $sorted | Where-Object { [version]$_ -le $target }

$rows = New-Object System.Collections.Generic.List[object]
foreach ($version in $eligible) {
    $textFromTag = Get-ManifestTextFromTag -RepoRoot $repoRoot -Version $version -ManifestPath $manifestPathInRepo
    if (-not $textFromTag) {
        continue
    }

    $body = Get-ManifestChangeSummaryBody -Markdown $textFromTag
    if (-not $body) {
        continue
    }

    $rows.Add([pscustomobject]@{
        Version = $version
        Summary = Get-FirstSummaryBullet -SectionBody $body
    }) | Out-Null
}

if (-not ($rows | Where-Object { $_.Version -eq $TargetVersion })) {
    $currentBody = Get-ManifestChangeSummaryBody -Markdown $manifestText
    $rows.Add([pscustomobject]@{
        Version = $TargetVersion
        Summary = if ($currentBody) { Get-FirstSummaryBullet -SectionBody $currentBody } else { 'N/A' }
    }) | Out-Null
}

$rows = @($rows | Sort-Object { [version]$_.Version })
if ($rows.Count -eq 0) {
    $rows = @([pscustomobject]@{
        Version = $TargetVersion
        Summary = 'N/A'
    })
}

$generatedBlock = New-CumulativeBlock -Rows $rows
$startMarker = '<!-- CUMULATIVE:START -->'
$endMarker = '<!-- CUMULATIVE:END -->'
$replacement = "$startMarker`r`n$generatedBlock`r`n$endMarker"

if ($manifestText -match [regex]::Escape($startMarker) -and $manifestText -match [regex]::Escape($endMarker)) {
    $pattern = "(?s)" + [regex]::Escape($startMarker) + ".*?" + [regex]::Escape($endMarker)
    $updated = [regex]::Replace($manifestText, $pattern, [System.Text.RegularExpressions.MatchEvaluator]{ param($m) $replacement }, 1)
}
else {
    $updated = $manifestText.TrimEnd() + "`r`n`r`n---`r`n`r`n" + $replacement + "`r`n"
}

if ($Check) {
    $normalizedCurrent = $manifestText.TrimEnd("`r", "`n") + "`r`n"
    $normalizedUpdated = $updated.TrimEnd("`r", "`n") + "`r`n"
    if ($normalizedUpdated -ceq $normalizedCurrent) {
        Write-Host "[$Lang] cumulative section is up to date: $manifestPath"
    }
    else {
        Write-Error "[$Lang] cumulative section is outdated: $manifestPath"
        exit 1
    }
}
elseif ($DryRun) {
    Write-Host "[$Lang] cumulative section prepared (dry-run)."
}
else {
    $normalizedCurrent = $manifestText.TrimEnd("`r", "`n") + "`r`n"
    $normalizedUpdated = $updated.TrimEnd("`r", "`n") + "`r`n"

    if ($normalizedUpdated -ceq $normalizedCurrent) {
        Write-Host "[$Lang] cumulative section already up to date: $manifestPath"
    }
    else {
        $encoding = New-Object System.Text.UTF8Encoding($hasUtf8Bom)
        [System.IO.File]::WriteAllText($manifestPath, $normalizedUpdated, $encoding)
        Write-Host "[$Lang] cumulative section updated: $manifestPath"
    }
}
