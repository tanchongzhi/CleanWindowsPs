$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning WinSCP Visited Directories Cache..."

$Key = "HKCU:\Software\Martin Prikryl\WinSCP 2\Configuration\CDCache"
Remove-Item -Path $Key -Recurse -Force
