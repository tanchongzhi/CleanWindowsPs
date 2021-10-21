$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Font Cache..."

$Path = "$env:SystemRoot\ServiceProfiles\LocalService\AppData\Local\FontCache*.dat"
Get-ChildItem -Path $Path -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force

$Path = @(
    "$env:SystemRoot\System32\FNTCACHE.DAT",
    "$env:LOCALAPPDATA\GDIPFONTCACHEV1.DAT"
)
$Path | ForEach-Object { $null = (Test-Path -Path $_ -PathType Leaf) -and (Remove-Item -Path $_ -Force) }
