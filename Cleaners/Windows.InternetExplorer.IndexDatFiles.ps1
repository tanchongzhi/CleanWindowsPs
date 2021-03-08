$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Internet Explorer index.dat Files...'

$path = @(
    "$env:APPDATA\Microsoft\Windows\PrivacIE\*",
    "$env:APPDATA\Microsoft\Windows\IECompatCache\*",
    "$env:APPDATA\Microsoft\Windows\IETldCache\*"
)
Remove-Item -Path $path -Recurse -Force
