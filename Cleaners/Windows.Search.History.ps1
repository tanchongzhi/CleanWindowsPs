$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Search History..."

$Path = "$env:ProgramData\Microsoft\Search\*"
$Includes  = "*.log"
Get-ChildItem -Path $Path -Include $Includes  -Recurse -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force

$Path = "$env:LOCALAPPDATA\Microsoft\Windows\ConnectedSearch\History\*"
Remove-Item -Path $Path -Recurse -Force
