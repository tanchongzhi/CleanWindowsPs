$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning DB Browser For SQLite History..."

$Key = "HKCU:\Software\sqlitebrowser\sqlitebrowser\General"
$ValueNames = @(
    "recentFileList"
)
Remove-ItemProperty -LiteralPath $Key -Name $ValueNames -Force
