$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Game Explorer..."

$Path = "$env:LOCALAPPDATA\Microsoft Games\*"
$Includes  = @(
    "*.xml.bak"
)
Get-ChildItem -Path $Path -Include $Includes  -Recurse -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force

$Path = @(
    "$env:LOCALAPPDATA\Microsoft\Windows\GameExplorer\GameStatistics\*",
    "$env:LOCALAPPDATA\Microsoft\GFWLive\*"
)
Remove-Item -Path $Path -Recurse -Force
