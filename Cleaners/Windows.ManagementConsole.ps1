$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Management Console...'

$keyPath = "HKCU:\Software\Microsoft\Microsoft Management Console\Recent File List\"
Remove-Item -LiteralPath $keyPath -Recurse -Force
