$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Python Npm Cache..."

$Path = @(
    "$APPDATA\npm-cache",
    "$LOCALAPPDATA\npm-cache"
)
Remove-Item -Path $Path -Recurse -Force
