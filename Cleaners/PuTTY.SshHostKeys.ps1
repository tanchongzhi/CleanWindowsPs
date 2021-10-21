$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning PuTTY SSH Host Keys..."

$Key = "HKCU:\Software\SimonTatham\PuTTY\SshHostKeys"
Remove-ItemProperty -Path $Key -Name "*" -Force
