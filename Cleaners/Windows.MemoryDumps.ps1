$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Memory Dumps...'

$path = "$env:SystemRoot\memory.dmp"
$null = (Test-Path -Path $path -PathType Leaf) -and (Remove-Item -Path $path -Force)

$path = @(
    "$env:SystemRoot\Minidump\*.dmp",
    "$env:SystemRoot\LiveKernelReports\*.dmp",
    "$env:LOCALAPPDATA\CrashDumps\*.dmp",
    "$env:ProgramData\Miscrosoft\Dr Watson\*.dmp"
)
Get-ChildItem -Path $path -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force

