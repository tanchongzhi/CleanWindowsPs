$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Paint History...'

$keyPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Recent File List\"
Remove-Item -LiteralPath $keyPath -Recurse -Force
