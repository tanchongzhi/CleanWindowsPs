$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Internet Explorer History...'

$path = @(
    "$env:LOCALAPPDATA\Microsoft\Windows\History\*",
    "$env:APPDATA\Microsoft\Windows\IEDownloadHistory\*",
    "$env:LOCALAPPDATA\Microsoft\Internet Explorer\Recovery\*"
)
Remove-Item -Path $path -Recurse -Force
