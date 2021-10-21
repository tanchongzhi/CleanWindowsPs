function Remove-UnreachableEnvironmentPathCore {
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $KeyPath
    )

    $pathValue = (Get-ItemProperty -Path $KeyPath).Path
    $dirs = $pathValue.Split(";", [System.StringSplitOptions]::RemoveEmptyEntries) |
        Where-Object -FilterScript { Test-Path -Path ([System.Environment]::ExpandEnvironmentVariables($_)) -PathType Container }

    $pathValue = $dirs -join ";"
    $null = Set-ItemProperty -Path $KeyPath -Name Path -Value $pathValue -Force
}

function Remove-UnreachableEnvironmentPath {
    try {
        Remove-UnreachableEnvironmentPathCore -KeyPath "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\"
    } catch {
        #
    }

    try {
        Remove-UnreachableEnvironmentPathCore -KeyPath "HKCU:\Environment\"
    } catch {
        #
    }
}


$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Path Environment Variable..."

Remove-UnreachableEnvironmentPath
