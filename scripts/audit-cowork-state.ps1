<#
.SYNOPSIS
Read-only size audit of an installed project's live cowork state.
.DESCRIPTION
Thresholds are warnings, not token estimates or release gates. All existing
member states are checked; archived logs/imported context are never traversed.
Use -Check to return exit code 1 for findings, 0 when clear. Invalid input fails.
#>
param(
    [Parameter(Mandatory = $true)]
    [string]$ProjectRoot,
    [ValidateRange(1, 2147483647)]
    [int]$ProjectStateBytes = 24576,
    [ValidateRange(1, 2147483647)]
    [int]$MemberStateBytes = 12288,
    [ValidateRange(1, 2147483647)]
    [int]$MaxLineCharacters = 800,
    [switch]$Check
)

$ErrorActionPreference = 'Stop'
$resolvedRoot = (Resolve-Path -LiteralPath $ProjectRoot).Path
$coworkRoot = Join-Path $resolvedRoot '.cowork'
$sharedPath = Join-Path $coworkRoot '06_evolution/project_state.md'
if (-not (Test-Path -LiteralPath $sharedPath -PathType Leaf)) {
    throw "Missing shared state: $sharedPath"
}

$targets = @([pscustomobject]@{ Path = $sharedPath; Budget = $ProjectStateBytes })
$membersPath = Join-Path $coworkRoot 'members'
if (Test-Path -LiteralPath $membersPath -PathType Container) {
    foreach ($member in Get-ChildItem -LiteralPath $membersPath -Directory | Sort-Object Name) {
        $statePath = Join-Path $member.FullName 'workspace/my_state.md'
        if (Test-Path -LiteralPath $statePath -PathType Leaf) {
            $targets += [pscustomobject]@{ Path = $statePath; Budget = $MemberStateBytes }
        }
    }
}

$hasFindings = $false
foreach ($target in $targets) {
    $file = Get-Item -LiteralPath $target.Path
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    $lines = @($content -split '\r?\n')
    $longLines = @()
    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($lines[$i].Length -gt $MaxLineCharacters) { $longLines += ($i + 1) }
    }
    $overBudget = $file.Length -gt $target.Budget
    $warning = $overBudget -or $longLines.Count -gt 0
    if ($warning) { $hasFindings = $true }
    $relative = $file.FullName.Substring($resolvedRoot.TrimEnd('\', '/').Length).TrimStart('\', '/')
    $status = if ($warning) { 'WARN' } else { 'OK' }
    Write-Output ("[{0}] {1}: {2} bytes / {3}; long lines: {4}" -f $status, $relative, $file.Length, $target.Budget, $longLines.Count)
    if ($longLines.Count -gt 0) {
        Write-Output ("  First line numbers: {0}" -f (($longLines | Select-Object -First 10) -join ', '))
    }
}
Write-Output 'Read-only: review R1/R2, preserving constraints and evidence links. No files changed.'
if ($Check -and $hasFindings) { exit 1 }
if ($Check) { exit 0 }
