$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Internet Explorer Addon Stats..."

$Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\"
Remove-Item -LiteralPath $Key -Recurse -Force
