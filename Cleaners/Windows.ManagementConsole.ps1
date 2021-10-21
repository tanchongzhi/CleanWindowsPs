$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Management Console..."

$Key = "HKCU:\Software\Microsoft\Microsoft Management Console\Recent File List\"
Remove-Item -LiteralPath $Key -Recurse -Force
