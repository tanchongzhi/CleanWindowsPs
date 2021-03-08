$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Explorer Taskbar Jump Lists...'

$path = @(
    "$env:APPDATA\Microsoft\Windows\Recent\CustomDestinations\*.customDestinations-ms",
    "$env:APPDATA\Microsoft\Windows\Recent\AutomaticDestinations\*.automaticDestinations-ms"
)
Get-ChildItem -Path $path -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force
