$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Npm Cache..."

$Path = @(
    "$APPDATA\npm-cache",
    "$LOCALAPPDATA\npm-cache"
)
Remove-Item -Path $Path -Recurse -Force
