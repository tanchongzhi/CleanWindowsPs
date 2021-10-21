$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning 7-Zip History..."

$Key = "HKCU:\Software\7-Zip\FM\"
$ValueNames = @(
    "CopyHistory",
    "FolderHistory",
    "PanelPath0"
)
Remove-ItemProperty -LiteralPath $Key -Name $ValueNames -Force

$Key = "HKCU:\Software\7-Zip\Compression\"
$ValueNames = @(
    "ArcHistory"
)
Remove-ItemProperty -LiteralPath $Key -Name $ValueNames -Force

$Key = "HKCU:\Software\7-Zip\Extraction\"
$ValueNames = @(
    "PathHistory"
)
Remove-ItemProperty -LiteralPath $Key -Name $ValueNames -Force
