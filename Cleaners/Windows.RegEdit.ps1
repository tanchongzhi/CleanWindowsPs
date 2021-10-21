$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows RegEdit History..."

$Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit\"
$ValueNames = @(
    "LastKey"
)
Remove-ItemProperty -Path $Key -Name $ValueNames -Force
