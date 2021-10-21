$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Paint History..."

$Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Recent File List\"
Remove-Item -LiteralPath $Key -Recurse -Force
