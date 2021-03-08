$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Explorer Thumbnail Cache...'

$path = "$env:LOCALAPPDATA\Microsoft\Windows\Explorer\thumbcache_*.db"
Get-ChildItem -Path $path -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force
