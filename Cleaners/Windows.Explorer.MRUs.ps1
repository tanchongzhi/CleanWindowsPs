$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Explorer MRU Lists..."

$Key = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU\",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU\",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\FindComputerMRU\",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\PrnPortsMRU\",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Map Network Drive MRU\",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery\",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths\",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpaper\MRU\",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers\Images\"
)
Remove-Item -LiteralPath $Key -Recurse -Force

$Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ComputerDescriptions\"
$ValueNames = @(
    "Name",
    "Id"
)
Remove-ItemProperty -LiteralPath $Key -Name $ValueNames -Force

$Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit\"
$ValueNames = @(
    "LastKey"
)
Remove-ItemProperty -LiteralPath $Key -Name $ValueNames -Force

$Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers\"
$ValueNames = @(
    "BackgroundHistoryPath0",
    "BackgroundHistoryPath1",
    "BackgroundHistoryPath2",
    "BackgroundHistoryPath3",
    "BackgroundHistoryPath4"
)
Remove-ItemProperty -LiteralPath $Key -Name $ValueNames -Force
