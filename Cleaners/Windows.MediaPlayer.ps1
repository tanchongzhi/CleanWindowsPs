$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Media Player..."

$Key = @(
    "HKCU:\Software\Microsoft\MediaPlayer\Player\RecentFileList\",
    "HKCU:\Software\Microsoft\MediaPlayer\Player\RecentURLList\",
    "HKCU:\Software\Microsoft\MediaPlayer\AutoComplete\MediaEdit\",
    "HKCU:\Software\Microsoft\MediaPlayer\Radio\MRUList\",
    "HKCU:\Software\Microsoft\MediaPlayer\Services\MediaGuide\"
)
Remove-Item -LiteralPath $Key -Recurse -Force

$Key = "HKCU:\Software\Microsoft\MediaPlayer\Preferences\"
$ValueNames = @(
    "LastPlayList",
    "LastPlayListIndex"
)
Remove-ItemProperty -LiteralPath $Key -Name $ValueNames -Force

$Key = "HKCU:\Software\Microsoft\MediaPlayer\Player\Settings\"
$ValueNames = @(
    "SaveAsDir"
)
Remove-ItemProperty -LiteralPath $Key -Name $ValueNames -Force

$Path = @(
    "$env:LOCALAPPDATA\Microsoft\Media Player\Art Cache\LocalMLS\*",
    "$env:LOCALAPPDATA\Microsoft\Media Player\Transcoded Files Cache\*"
)
Remove-Item -Path $Path -Recurse -Force

$Path = "$env:LOCALAPPDATA\Microsoft\Media Player\cacheentry*.*"
Get-ChildItem -Path $Path -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force

$Path = "$env:LOCALAPPDATA\Microsoft\Media Player\lastplayed.wpl"
$null = (Test-Path -Path $Path -PathType Leaf) -and (Remove-Item -Path $Path -Force)
