$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Internet Explorer index.dat Files..."

$Path = @(
    "$env:APPDATA\Microsoft\Windows\PrivacIE\*",
    "$env:APPDATA\Microsoft\Windows\IECompatCache\*",
    "$env:APPDATA\Microsoft\Windows\IETldCache\*"
)
Remove-Item -Path $Path -Recurse -Force
