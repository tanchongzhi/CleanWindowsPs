$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Explorer Run History in Start Menu..."

$Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU\"
Remove-Item -LiteralPath $Key -Recurse -Force
