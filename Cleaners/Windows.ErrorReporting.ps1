$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Error Reporting..."

$Path = @(
    "$env:ProgramData\Microsoft\Windows\WER\ReportArchive\*",
    "$env:ProgramData\Microsoft\Windows\WER\ReportQueue\*",
    "$env:LOCALAPPDATA\Microsoft\Windows\WER\ReportArchive\*",
    "$env:LOCALAPPDATA\Microsoft\Windows\WER\ReportQueue\*",
    "$env:LOCALAPPDATA\ElevatedDiagnostics\*"
)
Remove-Item -Path $Path -Recurse -Force
