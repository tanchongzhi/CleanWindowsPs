$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Internet Explorer Last Download Location..."

$Key = "HKCU:\Software\Microsoft\Internet Explorer\"
$ValueNames = @(
    "Download Directory"
)
Remove-ItemProperty -LiteralPath $Key -Name $ValueNames -Force

$Key = "HKCU:\Software\Microsoft\Internet Explorer\Main\"
$ValueNames = @(
    "Save Directory"
)
Remove-ItemProperty -LiteralPath $Key -Name $ValueNames -Force

$Key = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU\",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU\"
)
Remove-Item -LiteralPath $Key -Recurse -Force
