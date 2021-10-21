$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Internet Explorer Cookies..."

$Path = @(
    "$env:APPDATA\Microsoft\Windows\Cookies\*",
    "$env:LOCALAPPDATA\Microsoft\Internet Explorer\DOMStore\*"
)
Remove-Item -Path $Path -Recurse -Force
