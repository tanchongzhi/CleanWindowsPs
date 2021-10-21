$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning WinSCP SSH Host Keys..."

$Key = "HKCU:\Software\Martin Prikryl\WinSCP 2\SshHostKeys"
Remove-ItemProperty -Path $Key -Name "*" -Force
