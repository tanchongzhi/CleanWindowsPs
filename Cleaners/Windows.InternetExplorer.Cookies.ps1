$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Internet Explorer Cookies...'

$path = @(
    "$env:APPDATA\Microsoft\Windows\Cookies\*",
    "$env:LOCALAPPDATA\Microsoft\Internet Explorer\DOMStore\*"
)
Remove-Item -Path $path -Recurse -Force
