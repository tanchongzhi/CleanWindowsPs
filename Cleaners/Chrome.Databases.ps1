$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Chrome Databases..."

$Path = @(
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\databases\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\blob_storage\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\IndexedDB\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\databases\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\blob_storage\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\IndexedDB\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\databases\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\blob_storage\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\IndexedDB\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\databases\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\blob_storage\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\IndexedDB\*"
)
Remove-Item -Path $Path -Recurse -Force

# # No leveldb support yet. The following code will cause losing extension settings.
#
# $Path = @(
#     "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Local Storage\leveldb\*"
#     "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Local Storage\leveldb\*",
#     "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Local Storage\leveldb\*"
#     "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Local Storage\leveldb\*"
# )
# Remove-Item -Path $Path -Recurse -Force
