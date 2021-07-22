$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Log Files...'

$path = @(
    "$env:SystemRoot\System32\wbem\Logs\*.log",
    "$env:SystemRoot\System32\wbem\Logs\*.lo_",
    "$env:SystemRoot\SysWOW64\wbem\Logs\*.log",
    "$env:SystemRoot\SysWOW64\wbem\Logs\*.lo_",
    "$env:SystemRoot\*.log",
    "$env:SystemRoot\*log.txt",
    "$env:SystemRoot\security\logs\*.log",
    "$env:SystemRoot\security\logs\*.old"
)
Get-ChildItem -Path $path -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force

$path = @(
    "$env:SystemRoot\debug\*",
    "$env:SystemRoot\logs\*",
    "$env:SystemRoot\ServiceProfiles\LocalService\AppData\*",
    "$env:SystemRoot\ServiceProfiles\NetworkService\AppData\*",
    "$env:LOCALAPPDATA\Microsoft\Windows\*",
    "$env:APPDATA\Microsoft\Windows\*",
    "$env:SystemRoot\Microsoft.NET\*"
)
$includes = "*.log"
Get-ChildItem -Path $path -Include $includes -Recurse -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force

$path = @(
    "$env:ProgramData\Miscrosoft\Dr Watson\*.log",
    "$env:SystemRoot\SoftwareDistribution\*.log",
    "$env:SystemRoot\ModemLogs\*.txt"
)
Get-ChildItem -Path $path -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force

$path = @(
    "$env:SystemRoot\inf\setupapi.dev.log",
    "$env:SystemRoot\inf\setupapi.app.log"
    "$env:SystemRoot\Panther\UnattendGC\setupact.log",
    "$env:SystemRoot\Panther\UnattendGC\setuperr.log",
    "$env:SystemRoot\Panther\setupact.log",
    "$env:SystemRoot\Panther\setuperr.log"
    "$env:SystemRoot\Performance\WinSAT\winsat.log",
    "$env:SystemRoot\SchedLgU.txt"
)
$path | ForEach-Object { $null = (Test-Path -Path $_ -PathType Leaf) -and (Remove-Item -Path $_ -Force) }
