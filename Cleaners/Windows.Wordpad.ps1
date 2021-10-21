$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Wordpad History..."

$Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Applets\Wordpad\Recent File List\"
Remove-Item -LiteralPath $Key -Recurse -Force
