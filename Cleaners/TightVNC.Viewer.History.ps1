$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning TightVNC Viewer History..."

$Key = "HKCU:\Software\TightVNC\Viewer\History"
Remove-ItemProperty -Path $Key -Name "*" -Force
