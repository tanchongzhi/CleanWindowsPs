$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Microsoft Visual Studio MRU Lists...'

function Clear-VisualStudioMRUs {
    param (
        # Version Code
        [Parameter(Mandatory = $true)]
        [int]
        $VersionCode
    )

    $configDir = Get-Item -Path "$env:LOCALAPPDATA\Microsoft\VisualStudio\$VersionCode.*\"

    if (-not $configDir) {
        return
    }
    
    $name = Split-Path -Path $configDir -Leaf
    
    $item = Get-Item -Path "$configDir\ApplicationPrivateSettings.xml"

    if ($item) {
        $doc = New-Object -TypeName System.Xml.XmlDocument
        $doc.Load($item.FullName)
        
        $value = $doc.DocumentElement.SelectSingleNode("/content/indexed/collection[@name='CodeContainers.Offline']/value[@name='value']")

        if ($value) {
            $value.InnerText = '[]'

            $encoding = New-Object -TypeName System.Text.UTF8Encoding -ArgumentList $false
            $writer = New-Object -TypeName System.IO.StreamWriter -ArgumentList $item.FullName, $false, $encoding
            
            try {
                $doc.Save($writer)
            }
            finally {
                $writer.Dispose()
            }
        }
    }

    $item = Get-Item -Path "$configDir\privateregistry.bin"

    if ($item) {
        $null = New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS

        $null = reg load "HKU\VisualStudio_$name" $item.FullName

        try {            
            Remove-Item -Path "HKU:\VisualStudio_$name\Software\Microsoft\VisualStudio\$name\MRUItems\" -Recurse -Force 
        }
        finally {
            $null = reg unload "HKU\VisualStudio_$name"
        }
    }
}

Clear-VisualStudioMRUs -VersionCode 15
Clear-VisualStudioMRUs -VersionCode 16
Clear-VisualStudioMRUs -VersionCode 17
