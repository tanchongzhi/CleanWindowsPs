$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Window Size and Location Cache...'

$keyPath = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StreamMRU\",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Streams\"
)
Remove-Item -LiteralPath $keyPath -Recurse -Force
