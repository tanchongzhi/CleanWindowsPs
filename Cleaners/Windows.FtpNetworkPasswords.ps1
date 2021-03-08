$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows FTP Network Passwords...'

$keyPath = "HKCU:\Software\Microsoft\Ftp\Accounts\"
Remove-Item -LiteralPath $keyPath -Recurse -Force
