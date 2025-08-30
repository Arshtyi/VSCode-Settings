Param(
    [string]$Source = "C:\Users\Arshtyi\AppData\Roaming\Code\User",
    [string]$ProjectRoot = (Split-Path -Parent $PSScriptRoot)
)

$destSettings = Join-Path $ProjectRoot 'settings.json'
$destSnippets = Join-Path $ProjectRoot 'snippets'

Write-Output "Source: $Source"
Write-Output "Project root: $ProjectRoot"

$sourceSettings = Join-Path $Source 'settings.json'
$sourceSnippets = Join-Path $Source 'snippets'

if (-not (Test-Path $Source)) {
    Write-Error "Source path does not exist: $Source"
    exit 1
}

# Ensure destination snippets directory exists
if (-not (Test-Path $destSnippets)) {
    New-Item -Path $destSnippets -ItemType Directory -Force | Out-Null
}

if (Test-Path $sourceSettings) {
    Copy-Item -Path $sourceSettings -Destination $destSettings -Force
    Write-Output "Copied settings.json to $destSettings"
} else {
    Write-Warning "No settings.json found at $sourceSettings"
}

if (Test-Path $sourceSnippets) {
    Copy-Item -Path (Join-Path $sourceSnippets '*') -Destination $destSnippets -Recurse -Force
    Write-Output "Copied snippets to $destSnippets"
} else {
    Write-Warning "No snippets directory found at $sourceSnippets"
}

Write-Output "Done."
