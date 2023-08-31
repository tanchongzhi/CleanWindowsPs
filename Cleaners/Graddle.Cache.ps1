$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Graddle Cache..."

$Path = "$USERPROFILE\.graddle\caches"
Remove-Item -Path $Path -Recurse -Force
