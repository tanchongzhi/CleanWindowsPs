$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Font Cache...'

$path = "$env:SystemRoot\ServiceProfiles\LocalService\AppData\Local\FontCache*.dat"
Get-ChildItem -Path $path -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force

$path = @(
    "$env:SystemRoot\System32\FNTCACHE.DAT",
    "$env:LOCALAPPDATA\GDIPFONTCACHEV1.DAT"
)
$path | ForEach-Object { (Test-Path -Path $_ -PathType Leaf) -and (Remove-Item -Path $_ -Force) }
