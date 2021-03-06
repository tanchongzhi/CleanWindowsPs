$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Explorer Icon Cache...'

$path = "$env:LOCALAPPDATA\IconCache.db"
$null = (Test-Path -Path $path -PathType Leaf) -and (Remove-Item -Path $path -Force)
