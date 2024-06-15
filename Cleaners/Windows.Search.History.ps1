$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Search History..."

$serviceStatus = (Get-Service -Name WSearch).Status

if ($serviceStatus -eq "Running") {
    Set-Service -Name WSearch -Status Stopped
}

$Path = "$env:ProgramData\Microsoft\Search\*"
$Includes  = "*.log"
Get-ChildItem -Path $Path -Include $Includes  -Recurse -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force

$Path = "$env:ProgramData\Microsoft\Search\Data\Applications\Windows\Windows.edb"
Remove-Item -Path $Path -Recurse -Force

$Path = "$env:LOCALAPPDATA\Microsoft\Windows\ConnectedSearch\History\*"
Remove-Item -Path $Path -Recurse -Force

if ($serviceStatus -eq "Running") {
    Set-Service -Name WSearch -Status Running
}
