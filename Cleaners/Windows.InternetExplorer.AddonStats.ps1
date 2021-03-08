$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Internet Explorer Addon Stats...'

$keyPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\"
Remove-Item -LiteralPath $keyPath -Recurse -Force
