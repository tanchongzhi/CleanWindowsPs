$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Chrome Cookies..."

$Path = @(
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cookies*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Extension Cookies*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Cookies*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Extension Cookies*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cookies*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Extension Cookies*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Cookies*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Extension Cookies*"
)
Remove-Item -Path $Path -Recurse -Force
