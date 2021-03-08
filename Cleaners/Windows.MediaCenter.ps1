$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Media Center...'

$path = @(
    "$env:ProgramData\Microsoft\eHome\logs\*",
    "$env:LOCALAPPDATA\Microsoft\eHome\*",
    "$env:PUBLIC\Recorded TV\TempRec\TempSBE\*"
)
Remove-Item -Path $path -Recurse -Force
