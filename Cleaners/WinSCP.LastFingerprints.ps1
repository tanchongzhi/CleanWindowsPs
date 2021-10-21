$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning WinSCP Last Fingerprints..."

$Key = "HKCU:\Software\Martin Prikryl\WinSCP 2\Configuration\LastFingerprints"
Remove-ItemProperty -Path $Key -Name "*" -Force
