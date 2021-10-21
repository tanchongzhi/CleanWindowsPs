$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Log Files..."

$Path = @(
    "$env:SystemRoot\System32\wbem\Logs\*.log",
    "$env:SystemRoot\System32\wbem\Logs\*.lo_",
    "$env:SystemRoot\SysWOW64\wbem\Logs\*.log",
    "$env:SystemRoot\SysWOW64\wbem\Logs\*.lo_",
    "$env:SystemRoot\*.log",
    "$env:SystemRoot\*log.txt",
    "$env:SystemRoot\security\logs\*.log",
    "$env:SystemRoot\security\logs\*.old"
)
Get-ChildItem -Path $Path -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force

$Path = @(
    "$env:SystemRoot\debug\*",
    "$env:SystemRoot\logs\*",
    "$env:SystemRoot\ServiceProfiles\LocalService\AppData\*",
    "$env:SystemRoot\ServiceProfiles\NetworkService\AppData\*",
    "$env:LOCALAPPDATA\Microsoft\Windows\*",
    "$env:APPDATA\Microsoft\Windows\*",
    "$env:SystemRoot\Microsoft.NET\*"
)
$Includes  = "*.log"
Get-ChildItem -Path $Path -Include $Includes  -Recurse -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force

$Path = @(
    "$env:ProgramData\Miscrosoft\Dr Watson\*.log",
    "$env:SystemRoot\SoftwareDistribution\*.log",
    "$env:SystemRoot\ModemLogs\*.txt"
)
Get-ChildItem -Path $Path -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force

$Path = @(
    "$env:SystemRoot\inf\setupapi.dev.log",
    "$env:SystemRoot\inf\setupapi.app.log"
    "$env:SystemRoot\Panther\UnattendGC\setupact.log",
    "$env:SystemRoot\Panther\UnattendGC\setuperr.log",
    "$env:SystemRoot\Panther\setupact.log",
    "$env:SystemRoot\Panther\setuperr.log"
    "$env:SystemRoot\Performance\WinSAT\winsat.log",
    "$env:SystemRoot\SchedLgU.txt"
)
$Path | ForEach-Object { $null = (Test-Path -Path $_ -PathType Leaf) -and (Remove-Item -Path $_ -Force) }
