$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Memory Dumps..."

$Path = "$env:SystemRoot\memory.dmp"
$null = (Test-Path -Path $Path -PathType Leaf) -and (Remove-Item -Path $Path -Force)

$Path = @(
    "$env:SystemRoot\Minidump\*.dmp",
    "$env:SystemRoot\LiveKernelReports\*.dmp",
    "$env:LOCALAPPDATA\CrashDumps\*.dmp",
    "$env:ProgramData\Miscrosoft\Dr Watson\*.dmp"
)
Get-ChildItem -Path $Path -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force

