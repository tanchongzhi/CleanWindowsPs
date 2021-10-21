<#
.SYNOPSIS
Clean Windows.
#>
[CmdletBinding()]
param (
    # Prints all available cleaner names.
    [Parameter(Mandatory = $true, ParameterSetName = "ListAvailable")]
    [switch]
    $ListAvailable,

    # Prints all selected cleaner names.
    [Parameter(Mandatory = $true, ParameterSetName = "ListSelected")]
    [switch]
    $ListSelected,

    # Invokes specified cleaners by their name. Wildcards are permitted.
    # If this parameter is ommited, invokes cleaners in SelectedCleaners.txt.
    [Parameter(ParameterSetName = "Name", Position = 0)]
    [ValidateScript( { $_ -notmatch '^[\s.]*$' } )]
    [string[]]
    $Name
)

if ($PSVersionTable.PSVersion.Major -eq 2) {
    $PSScriptRoot = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
}

$SelectedCleanersListFile = "$PSScriptRoot\SelectedCleaners.txt"

if ($ListAvailable) {
    Get-ChildItem -Path "$PSScriptRoot\Cleaners\*.ps1" -Force | ForEach-Object { $_.BaseName }
    exit
}

if ($ListSelected) {
    if (Test-Path -Path $SelectedCleanersListFile -PathType Leaf) {
        Get-Content -Path $SelectedCleanersListFile -Force
    }

    exit
}

if ($null -ne $Name) {
    $cleaners = foreach ($cleaner in (Get-ChildItem -Path "$PSScriptRoot\Cleaners\*.ps1" -Force)) {
        foreach ($n in $Name) {
            if ($cleaner.BaseName -like $n) {
                $cleaner
            }
        }
    }
} else {
    $cleaners = foreach ($cleanerName in (Get-Content -Path $SelectedCleanersListFile -Force)) {
        $cleaner = Get-Item -LiteralPath "$PSScriptRoot\Cleaners\$cleanerName.ps1" -Force -ErrorAction SilentlyContinue

        if ($null -ne $cleaner) {
            $cleaner
        }
    }
}

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

[System.Windows.Forms.Application]::EnableVisualStyles()

$canceled = [ref]$false

$mainForm = New-Object -TypeName System.Windows.Forms.Form
$mainForm.Font = New-Object -TypeName System.Drawing.Font -ArgumentList @("Microsoft YaHei", 9, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point)
$mainForm.Size = New-Object -TypeName System.Drawing.Size -ArgumentList @(600, 96)
$mainForm.Padding = New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @(16)
$mainForm.AutoScaleMode = [System.Windows.Forms.AutoScaleMode]::Font
$mainForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$mainForm.SizeGripStyle = [System.Windows.Forms.SizeGripStyle]::Hide
$mainForm.ControlBox = $false
$mainForm.ShowInTaskbar = $false
$mainForm.TopMost = $true
$mainForm.Text = "Cleaning Windows"

$stateLabel = New-Object -TypeName System.Windows.Forms.Label
$stateLabel.Dock = [System.Windows.Forms.DockStyle]::Fill
$stateLabel.AutoSize = $false
$stateLabel.AutoEllipsis = $true
$stateLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleLeft
$stateLabel.Padding = New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @(0, 0, 8, 0)
$stateLabel.Text = "Cleaning..."

$cancelButton = New-Object -TypeName System.Windows.Forms.Button
$cancelButton.Dock = [System.Windows.Forms.DockStyle]::Right
$cancelButton.Size = New-Object -TypeName System.Drawing.Size -ArgumentList @(96, 32)
$cancelButton.Text = "Cancel"
$cancelButton.add_Click({
    param (
        [Parameter()]
        [System.Object]
        $sender,

        [Parameter()]
        [System.EventArgs]
        $e
    )

    $canceled.Value = $true
})

$mainForm.Controls.AddRange(@(
    $stateLabel,
    $cancelButton
))

$mainForm.Show()

foreach ($cleaner in $cleaners) {
    if ($canceled.Value) {
        break
    }

    $cleanerName = $cleaner.BaseName
    $stateLabel.Text = "Cleaning $cleanerName"
    $stateLabel.Invalidate()
    [System.Windows.Forms.Application]::DoEvents()

    $processArgs = "-ExecutionPolicy Bypass -NoLogo -NoProfile -File `"$cleaner`""
    $process = Start-Process -FilePath powershell -ArgumentList $processArgs -NoNewWindow -WorkingDirectory $PSScriptRoot -PassThru

    do {
        [System.Windows.Forms.Application]::DoEvents()
    } until ($process.HasExited -or $canceled.Value)

    if (-not $process.HasExited) {
        $process.Kill()
    }

    $process.Close()
}

$stateLabel.Text = "Done"
$stateLabel.Invalidate()
[System.Windows.Forms.Application]::DoEvents()

$mainForm.Close()
$mainForm.Dispose()
