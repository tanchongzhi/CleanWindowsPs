$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Python Pip Cache..."

$Path = "$USERPROFILE\.graddle\caches"
Remove-Item -Path $Path -Recurse -Force
