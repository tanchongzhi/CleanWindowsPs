$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Explorer Run History in Start Menu...'

$keyPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU\"
Remove-Item -LiteralPath $keyPath -Recurse -Force
