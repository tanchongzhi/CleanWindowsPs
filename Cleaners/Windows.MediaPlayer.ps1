$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Media Player...'

$keyPath = @(
    "HKCU:\Software\Microsoft\MediaPlayer\Player\RecentFileList\",
    "HKCU:\Software\Microsoft\MediaPlayer\Player\RecentURLList\",
    "HKCU:\Software\Microsoft\MediaPlayer\AutoComplete\MediaEdit\",
    "HKCU:\Software\Microsoft\MediaPlayer\Radio\MRUList\",
    "HKCU:\Software\Microsoft\MediaPlayer\Services\MediaGuide\"
)
Remove-Item -LiteralPath $keyPath -Recurse -Force

$keyPath = "HKCU:\Software\Microsoft\MediaPlayer\Preferences\"
$valueNames = @(
    "LastPlayList",
    "LastPlayListIndex"
)
Remove-ItemProperty -LiteralPath $keyPath -Name $valueNames -Force

$keyPath = "HKCU:\Software\Microsoft\MediaPlayer\Player\Settings\"
$valueNames = @(
    "SaveAsDir"
)
Remove-ItemProperty -LiteralPath $keyPath -Name $valueNames -Force

$path = @(
    "$env:LOCALAPPDATA\Microsoft\Media Player\Art Cache\LocalMLS\*",
    "$env:LOCALAPPDATA\Microsoft\Media Player\Transcoded Files Cache\*"
)
Remove-Item -Path $path -Recurse -Force

$path = "$env:LOCALAPPDATA\Microsoft\Media Player\cacheentry*.*"
Get-ChildItem -Path $path -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force

$path = "$env:LOCALAPPDATA\Microsoft\Media Player\lastplayed.wpl"
$null = (Test-Path -Path $path -PathType Leaf) -and (Remove-Item -Path $path -Force)
