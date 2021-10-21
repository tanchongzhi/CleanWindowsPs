$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Explorer Taskbar Jump Lists..."

$Path = @(
    "$env:APPDATA\Microsoft\Windows\Recent\CustomDestinations\*.customDestinations-ms",
    "$env:APPDATA\Microsoft\Windows\Recent\AutomaticDestinations\*.automaticDestinations-ms"
)
Get-ChildItem -Path $Path -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force
