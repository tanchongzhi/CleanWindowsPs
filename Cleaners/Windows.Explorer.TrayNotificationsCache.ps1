$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Explorer Tray Notifications Cache...'

$keyPath = "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify\"
$valueNames = @(
    "IconStreams",
    "PastIconsStream"
)
Remove-ItemProperty -LiteralPath $keyPath -Name $valueNames -Force
