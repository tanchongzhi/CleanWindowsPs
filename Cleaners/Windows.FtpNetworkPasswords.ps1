$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows FTP Network Passwords..."

$Key = "HKCU:\Software\Microsoft\Ftp\Accounts\"
Remove-Item -LiteralPath $Key -Recurse -Force
