$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Explorer MRU Lists...'

$keyPath = @(
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
Remove-Item -LiteralPath $keyPath -Recurse -Force

$keyPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ComputerDescriptions\"
$valueNames = @(
    "Name",
    "Id"
)
Remove-ItemProperty -LiteralPath $keyPath -Name $valueNames -Force

$keyPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit\"
$valueNames = @(
    "LastKey"
)
Remove-ItemProperty -LiteralPath $keyPath -Name $valueNames -Force

$keyPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers\"
$valueNames = @(
    "BackgroundHistoryPath0",
    "BackgroundHistoryPath1",
    "BackgroundHistoryPath2",
    "BackgroundHistoryPath3",
    "BackgroundHistoryPath4"
)
Remove-ItemProperty -LiteralPath $keyPath -Name $valueNames -Force
