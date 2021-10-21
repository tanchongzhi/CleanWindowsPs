$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Explorer Icon Cache..."

$Path = "$env:LOCALAPPDATA\IconCache.db"
$null = (Test-Path -Path $Path -PathType Leaf) -and (Remove-Item -Path $Path -Force)
