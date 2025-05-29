$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Internet Download Manager..."

$Path = "$env:APPDATA\IDM\UrlHistory.txt"
Remove-Item -Path $Path -Force
