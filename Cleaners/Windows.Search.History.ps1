$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Search History...'

$path = "$env:ProgramData\Microsoft\Search\*"
$includes = "*.log"
Get-ChildItem -Path $path -Include $includes -Recurse -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force

$path = "$env:LOCALAPPDATA\Microsoft\Windows\ConnectedSearch\History\*"
Remove-Item -Path $path -Recurse -Force
