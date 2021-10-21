$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Explorer Menu Order..."

$Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\MenuOrder\"
Remove-Item -LiteralPath $Key -Recurse -Force
