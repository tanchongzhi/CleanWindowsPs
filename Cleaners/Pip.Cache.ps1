$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Python Pip Cache..."

$Path = "$APPDATA\pip\cache"
Remove-Item -Path $Path -Recurse -Force
