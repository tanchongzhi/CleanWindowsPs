$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows RegEdit History...'

$keyPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit\"
$valueNames = @(
    "LastKey"
)
Remove-ItemProperty -Path $keyPath -Name $valueNames -Force
