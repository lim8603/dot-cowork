param(
    [Parameter(Mandatory = $true)]
    [ValidatePattern('^\d+\.\d+\.\d+$')]
    [string]$FromVersion,

    [Parameter(Mandatory = $true)]
    [ValidatePattern('^\d+\.\d+\.\d+$')]
    [string]$ToVersion,

    [ValidateSet('ko', 'en')]
    [string]$Lang = 'ko',

    [string]$OutputPath
)

$ErrorActionPreference = 'Stop'

function Get-VersionListFromTags {
    param(
        [Parameter(Mandatory = $true)]
        [string]$RepoRoot
    )

    $rawTags = git -C $RepoRoot tag --list 'v*'
    if (-not $rawTags) {
        throw "No git tags found. Expected tags like v1.0.0"
    }

    $versions = @()
    foreach ($tag in $rawTags) {
        if ($tag -match '^v(\d+\.\d+\.\d+)$') {
            $versions += $Matches[1]
        }
    }

    if (-not $versions) {
        throw "No semantic version tags found. Expected tags like v1.0.0"
    }

    return $versions | Sort-Object { [version]$_ } -Unique
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

function Get-ManifestFromTag {
    param(
        [Parameter(Mandatory = $true)]
        [string]$RepoRoot,
        [Parameter(Mandatory = $true)]
        [string]$Version,
        [Parameter(Mandatory = $true)]
        [string]$ManifestPath
    )

    $previousEncoding = [Console]::OutputEncoding
    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
    try {
        $content = git -c i18n.logOutputEncoding=utf-8 -C $RepoRoot show "v$Version`:$ManifestPath" 2>$null
    }
    finally {
        [Console]::OutputEncoding = $previousEncoding
    }

    if ($LASTEXITCODE -ne 0 -or -not $content) {
        return $null
    }

    return ($content -join "`n")
}

$repoRoot = if ($PSScriptRoot) { Split-Path -Parent $PSScriptRoot } else { (Get-Location).Path }
$manifestPathInRepo = "frameworks/$Lang/.cowork/upgrade_manifest.md"

$from = [version]$FromVersion
$to = [version]$ToVersion
if ($from -ge $to) {
    throw "FromVersion must be lower than ToVersion. ($FromVersion -> $ToVersion)"
}

$allVersions = Get-VersionListFromTags -RepoRoot $repoRoot
if ($allVersions -notcontains $FromVersion) {
    throw "FromVersion v$FromVersion tag does not exist."
}
if ($allVersions -notcontains $ToVersion) {
    throw "ToVersion v$ToVersion tag does not exist."
}

$targetVersions = $allVersions | Where-Object {
    $v = [version]$_
    $v -gt $from -and $v -le $to
}

if (-not $targetVersions) {
    throw "No intermediate versions found between v$FromVersion and v$ToVersion."
}

$skipped = $targetVersions | Where-Object { $_ -ne $ToVersion }
$generatedAt = (Get-Date).ToString('yyyy-MM-dd')

$lines = New-Object System.Collections.Generic.List[string]
$lines.Add('# Upgrade Manifest - Cumulative (Generated)')
$lines.Add('')
$lines.Add('> Generated cumulative summary for sequential upgrade review (from git tags)')
$lines.Add('')
$lines.Add('---')
$lines.Add('')
$lines.Add('## Version Info')
$lines.Add('')
$lines.Add('| Item | Value |')
$lines.Add('|------|-------|')
$lines.Add("| Version | $ToVersion |")
$lines.Add("| From | $FromVersion |")
$lines.Add("| Date | $generatedAt |")
$lines.Add("| Language | $Lang |")
$lines.Add("| Source | frameworks/$Lang/.cowork/upgrade_manifest.md from git tags |")
if ($skipped.Count -gt 0) {
    $lines.Add("| Intermediate Versions | $($skipped -join ', ') |")
}
else {
    $lines.Add('| Intermediate Versions | none |')
}
$lines.Add('')
$lines.Add('---')
$lines.Add('')
$lines.Add("## Cumulative Change Summary ($FromVersion -> $ToVersion)")
$lines.Add('')

foreach ($version in $targetVersions) {
    $manifest = Get-ManifestFromTag -RepoRoot $repoRoot -Version $version -ManifestPath $manifestPathInRepo
    $lines.Add("### v$version")

    if (-not $manifest) {
        $lines.Add('- Could not read manifest (file missing in tag or path mismatch)')
        $lines.Add('')
        continue
    }

    $summary = Get-ManifestChangeSummaryBody -Markdown $manifest
    if (-not $summary) {
        $lines.Add('- Could not find a change summary section in this manifest')
        $lines.Add('')
        continue
    }

    $summaryLines = $summary -split "`r?`n"
    $hasBullet = $false
    foreach ($line in $summaryLines) {
        $trimmed = $line.TrimEnd()
        if ($trimmed -match '^\s*[-*]\s+') {
            $lines.Add($trimmed)
            $hasBullet = $true
        }
    }

    if (-not $hasBullet) {
        $plain = ($summaryLines | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }) -join ' '
        if ($plain) {
            $lines.Add("- $plain")
        }
        else {
            $lines.Add('- Summary text is empty')
        }
    }

    $lines.Add('')
}

$lines.Add('---')
$lines.Add('')
$lines.Add('## Usage Notes')
$lines.Add('')
$lines.Add('- This file is a helper for sequential upgrade analysis.')
$lines.Add('- Final ADD / REPLACE / MERGE / SKIP decisions must be confirmed against the target version official manifest.')
$lines.Add('- MERGE files should preserve project data and require human approval.')

$content = $lines -join "`r`n"

if ($OutputPath) {
    $resolvedOutput = if ([System.IO.Path]::IsPathRooted($OutputPath)) {
        $OutputPath
    }
    else {
        Join-Path $repoRoot $OutputPath
    }

    $outputDir = Split-Path -Parent $resolvedOutput
    if ($outputDir -and -not (Test-Path $outputDir)) {
        New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
    }

    Set-Content -Path $resolvedOutput -Value $content -Encoding utf8
    Write-Host "Generated cumulative manifest: $resolvedOutput"
}
else {
    Write-Output $content
}
