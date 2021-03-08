$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning 7-Zip History...'

$keyPath = "HKCU:\Software\7-Zip\FM\"
$valueNames = @(
    "CopyHistory",
    "FolderHistory",
    "PanelPath0"
)
Remove-ItemProperty -LiteralPath $keyPath -Name $valueNames -Force

$keyPath = "HKCU:\Software\7-Zip\Compression\"
$valueNames = @(
    "ArcHistory"
)
Remove-ItemProperty -LiteralPath $keyPath -Name $valueNames -Force

$keyPath = "HKCU:\Software\7-Zip\Extraction\"
$valueNames = @(
    "PathHistory"
)
Remove-ItemProperty -LiteralPath $keyPath -Name $valueNames -Force
