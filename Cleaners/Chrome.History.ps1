$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Chrome History..."

$Path = @(
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\History*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Archived History*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\DownloadMetadata",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Current Tabs",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Current Session",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Last Tabs",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Last Session",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Shortcuts*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Top Sites*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Visited Links",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Favicons*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Network Action Predictor*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Network Persistent State",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\JumpListIconsMostVisited\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\JumpListIconsRecentClosed\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\History*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Archived History*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\DownloadMetadata",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Current Tabs",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Current Session",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Last Tabs",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Last Session",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Shortcuts*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Top Sites",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Visited Links",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Favicons*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Network Action Predictor*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Network Persistent State",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\JumpListIconsMostVisited\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\JumpListIconsRecentClosed\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\History*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Archived History*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\DownloadMetadata",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Current Tabs",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Current Session",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Last Tabs",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Last Session",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Shortcuts*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Top Sites*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Visited Links",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Favicons*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Network Action Predictor*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Network Persistent State",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\JumpListIconsMostVisited\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\JumpListIconsRecentClosed\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\History*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Archived History*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\DownloadMetadata",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Current Tabs",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Current Session",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Last Tabs",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Last Session",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Shortcuts*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Top Sites",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Visited Links",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Favicons*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Network Action Predictor*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Network Persistent State",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\JumpListIconsMostVisited\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\JumpListIconsRecentClosed\*"
)
Remove-Item -Path $Path -Recurse -Force
