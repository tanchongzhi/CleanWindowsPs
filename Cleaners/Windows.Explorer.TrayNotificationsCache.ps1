$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Explorer Tray Notifications Cache..."

$Key = "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify\"
$ValueNames = @(
    "IconStreams",
    "PastIconsStream"
)
Remove-ItemProperty -LiteralPath $Key -Name $ValueNames -Force
