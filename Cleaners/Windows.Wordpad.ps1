$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Wordpad History...'

$keyPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Applets\Wordpad\Recent File List\"
Remove-Item -LiteralPath $keyPath -Recurse -Force
