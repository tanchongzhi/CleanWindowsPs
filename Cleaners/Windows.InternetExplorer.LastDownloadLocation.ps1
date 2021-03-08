$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Internet Explorer Last Download Location...'

$keyPath = "HKCU:\Software\Microsoft\Internet Explorer\"
$valueNames = @(
    "Download Directory"
)
Remove-ItemProperty -LiteralPath $keyPath -Name $valueNames -Force

$keyPath = "HKCU:\Software\Microsoft\Internet Explorer\Main\"
$valueNames = @(
    "Save Directory"
)
Remove-ItemProperty -LiteralPath $keyPath -Name $valueNames -Force

$keyPath = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU\",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU\"
)
Remove-Item -LiteralPath $keyPath -Recurse -Force
