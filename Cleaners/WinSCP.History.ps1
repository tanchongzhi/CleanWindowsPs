$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning WinSCP History..."

$Key = "HKCU:\Software\Martin Prikryl\WinSCP 2\Configuration\History"
Remove-Item -Path $Key -Recurse -Force
