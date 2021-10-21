$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Window Size and Location Cache..."

$Key = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StreamMRU\",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Streams\"
)
Remove-Item -LiteralPath $Key -Recurse -Force
