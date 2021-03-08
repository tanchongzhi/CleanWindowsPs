$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Game Explorer...'

$path = "$env:LOCALAPPDATA\Microsoft Games\*"
$includes = @(
    "*.xml.bak"
)
Get-ChildItem -Path $path -Include $includes -Recurse -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force

$path = @(
    "$env:LOCALAPPDATA\Microsoft\Windows\GameExplorer\GameStatistics\*",
    "$env:LOCALAPPDATA\Microsoft\GFWLive\*"
)
Remove-Item -Path $path -Recurse -Force
