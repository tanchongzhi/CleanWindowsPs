$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Explorer Menu Order...'

$keyPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\MenuOrder\"
Remove-Item -LiteralPath $keyPath -Recurse -Force
