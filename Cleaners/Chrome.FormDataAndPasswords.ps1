$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Chrome Form Data and Passwords...'

$path = @(
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Web Data*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Login Data*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Web Data*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Login Data*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Web Data*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Login Data*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Web Data*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Login Data*"
)
Remove-Item -Path $path -Recurse -Force
