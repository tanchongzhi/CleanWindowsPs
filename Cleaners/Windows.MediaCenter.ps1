$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Media Center..."

$Path = @(
    "$env:ProgramData\Microsoft\eHome\logs\*",
    "$env:LOCALAPPDATA\Microsoft\eHome\*",
    "$env:PUBLIC\Recorded TV\TempRec\TempSBE\*"
)
Remove-Item -Path $Path -Recurse -Force
