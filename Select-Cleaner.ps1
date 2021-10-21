if ($PSVersionTable.PSVersion.Major -eq 2) {
    $PSScriptRoot = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
}

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

[System.Windows.Forms.Application]::EnableVisualStyles()

$mainForm = New-Object -TypeName System.Windows.Forms.Form
$mainForm.Font = New-Object -TypeName System.Drawing.Font -ArgumentList @("Microsoft YaHei", 9, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point)
$mainForm.Size = New-Object -TypeName System.Drawing.Size -ArgumentList @(600, 480)
$mainForm.Padding = New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @(16)
$mainForm.AutoScaleMode = [System.Windows.Forms.AutoScaleMode]::Font
$mainForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$mainForm.Text = "Clean Windows"

$checkedListBoxLabel = New-Object -TypeName System.Windows.Forms.Label
$checkedListBoxLabel.Dock = [System.Windows.Forms.DockStyle]::Top
$checkedListBoxLabel.AutoSize = $true
$checkedListBoxLabel.Text = "Select cleaners:"

$listView = New-Object -TypeName System.Windows.Forms.ListView
$listView.Dock = [System.Windows.Forms.DockStyle]::Fill
$listView.Size = New-Object -TypeName System.Drawing.Size -ArgumentList @(600, 300)
$listView.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$listView.CheckBoxes = $true
$listView.FullRowSelect = $true
$listView.HeaderStyle = [System.Windows.Forms.ColumnHeaderStyle]::None
$listView.View = [System.Windows.Forms.View]::Details
$listView.ShowItemToolTips = $true

$listViewCleanerNameHeader = New-Object -TypeName System.Windows.Forms.ColumnHeader
$listViewCleanerNameHeader.Text = "Cleaner"
$listViewCleanerNameHeader.Width = -2

$null = $listView.Columns.Add($listViewCleanerNameHeader)

$selectHighlightedItemsButton = New-Object -TypeName System.Windows.Forms.ToolStripButton
$selectHighlightedItemsButton.AutoSize = $false
$selectHighlightedItemsButton.Width = 200
$selectHighlightedItemsButton.TextAlign = [System.Drawing.ContentAlignment]::MiddleLeft
$selectHighlightedItemsButton.Name = "SelectHighlightedItems"
$selectHighlightedItemsButton.Text = "Select Highlighted Items"
$selectHighlightedItemsButton.add_Click({
    param (
        [Parameter()]
        [System.Object]
        $sender,

        [Parameter()]
        [System.EventArgs]
        $e
    )

    foreach ($item in $listView.SelectedItems) {
        $item.Checked = $true
    }
})

$deselectHighlightedItemsButton = New-Object -TypeName System.Windows.Forms.ToolStripButton
$deselectHighlightedItemsButton.AutoSize = $false
$deselectHighlightedItemsButton.Width = 200
$deselectHighlightedItemsButton.TextAlign = [System.Drawing.ContentAlignment]::MiddleLeft
$deselectHighlightedItemsButton.Name = "DeselectHighlightedItems"
$deselectHighlightedItemsButton.Text = "Deselect Highlighted Items"
$deselectHighlightedItemsButton.add_Click({
    param (
        [Parameter()]
        [System.Object]
        $sender,

        [Parameter()]
        [System.EventArgs]
        $e
    )

    foreach ($item in $listView.SelectedItems) {
        $item.Checked = $false
    }
})

$selectAllItemsButton = New-Object -TypeName System.Windows.Forms.ToolStripButton
$selectAllItemsButton.AutoSize = $false
$selectAllItemsButton.Width = 200
$selectAllItemsButton.TextAlign = [System.Drawing.ContentAlignment]::MiddleLeft
$selectAllItemsButton.Name = "SelectAllItems"
$selectAllItemsButton.Text = "Select All Items"
$selectAllItemsButton.add_Click({
    param (
        [Parameter()]
        [System.Object]
        $sender,

        [Parameter()]
        [System.EventArgs]
        $e
    )

    foreach ($item in $listView.Items) {
        $item.Checked = $true
    }
})

$deselectAllItemsButton = New-Object -TypeName System.Windows.Forms.ToolStripButton
$deselectAllItemsButton.AutoSize = $false
$deselectAllItemsButton.Width = 200
$deselectAllItemsButton.TextAlign = [System.Drawing.ContentAlignment]::MiddleLeft
$deselectAllItemsButton.Name = "DeselectedAllItems"
$deselectAllItemsButton.Text = "Deselect All Items"
$deselectAllItemsButton.add_Click({
    param (
        [Parameter()]
        [System.Object]
        $sender,

        [Parameter()]
        [System.EventArgs]
        $e
    )

    foreach ($item in $listView.Items) {
        $item.Checked = $false
    }
})

$listViewContextMenuStrip = New-Object -TypeName System.Windows.Forms.ContextMenuStrip
$listViewContextMenuStrip.Items.AddRange(@(
    $selectAllItemsButton,
    $deselectAllItemsButton,
    $selectHighlightedItemsButton,
    $deselectHighlightedItemsButton
)) | Out-Null
$listViewContextMenuStrip.PerformLayout()

$listView.ContextMenuStrip = $listViewContextMenuStrip

$dialogButtonsPanel = New-Object -TypeName System.Windows.Forms.Panel
$dialogButtonsPanel.Dock = [System.Windows.Forms.DockStyle]::Bottom
$dialogButtonsPanel.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink
$dialogButtonsPanel.Size = New-Object -TypeName System.Drawing.Size -ArgumentList @(600, 40)
$dialogButtonsPanel.Padding = New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @(0, 8, 0, 0)

$okButton = New-Object -TypeName System.Windows.Forms.Button
$okButton.Dock = [System.Windows.Forms.DockStyle]::Right
$okButton.Size = New-Object -TypeName System.Drawing.Size -ArgumentList @(96, 32)
$okButton.Text = "OK"
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK

$cancelButton = New-Object -TypeName System.Windows.Forms.Button
$cancelButton.Dock = [System.Windows.Forms.DockStyle]::Right
$cancelButton.Size = New-Object -TypeName System.Drawing.Size -ArgumentList @(96, 32)
$cancelButton.Text = "Cancel"
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel

$dialogButtonsPanel.Controls.Add($okButton)
$dialogButtonsPanel.Controls.Add($cancelButton)

$mainForm.Controls.Add($listView)
$mainForm.Controls.Add($checkedListBoxLabel)
$mainForm.Controls.Add($dialogButtonsPanel)

$SelectedCleanersListFile = "$PSScriptRoot\SelectedCleaners.txt"

if (Test-Path -Path $SelectedCleanersListFile -PathType Leaf) {
    $selectedCleaners = Get-Content -Path $SelectedCleanersListFile -Force
} else {
    $selectedCleaners = @()
}

$availableCleaners = Get-ChildItem -Path $PSScriptRoot\Cleaners\*.ps1 -Force
$items = $availableCleaners | ForEach-Object {
    $item = New-Object -TypeName System.Windows.Forms.ListViewItem
    $item.Text = $_.BaseName
    $item.ToolTipText = $_.BaseName
    $item
}

$listView.Items.AddRange($items)

foreach ($item in $listView.Items) {
    foreach ($selectedItem in $selectedCleaners) {
        if ($item.Text -eq $selectedItem) {
            $item.Checked = $true
        }
    }
}

$result = $mainForm.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
    $listView.CheckedItems | Where-Object { $_.Checked } | ForEach-Object { $_.Text } | Out-File -FilePath $SelectedCleanersListFile -Force
}
