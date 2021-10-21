$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Explorer Thumbnail Cache..."

$Path = "$env:LOCALAPPDATA\Microsoft\Windows\Explorer\thumbcache_*.db"
Get-ChildItem -Path $Path -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force
