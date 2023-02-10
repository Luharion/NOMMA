slmgr.vbs /ipk 8NBT4-JHGVW-J9WGV-X7FX7-DRR9C
if ((Get-Command winget) -eq $null) {
    Write-Output "Winget is not installed."
Function Install-WinGet {
    #Install the latest package from GitHub
    [cmdletbinding(SupportsShouldProcess)]
    [alias("iwg")]
    [OutputType("None")]
    [OutputType("Microsoft.Windows.Appx.PackageManager.Commands.AppxPackage")]
    Param(
        [Parameter(HelpMessage = "Display the AppxPackage after installation.")]
        [switch]$Passthru
    )
    Write-Verbose "[$((Get-Date).TimeofDay)] Starting $($myinvocation.mycommand)"
    if ($PSVersionTable.PSVersion.Major -eq 7) {
        Write-Warning "This command does not work in PowerShell 7. You must install in Windows PowerShell."
        return
    }
    #test for requirement
    $Requirement = Get-AppPackage "Microsoft.DesktopAppInstaller"
    if (-Not $requirement) {
        Write-Verbose "Installing Desktop App Installer requirement"
        Try {
            Add-AppxPackage -Path "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx" -erroraction Stop
        }
        Catch {
            Throw $_
        }
    }
    $uri = "https://api.github.com/repos/microsoft/winget-cli/releases"
    Try {
        Write-Verbose "[$((Get-Date).TimeofDay)] Getting information from $uri"
        $get = Invoke-RestMethod -uri $uri -Method Get -ErrorAction stop
        Write-Verbose "[$((Get-Date).TimeofDay)] getting latest release"
        #$data = $get | Select-Object -first 1
        $data = $get[0].assets | Where-Object name -Match 'msixbundle'
        $appx = $data.browser_download_url
        #$data.assets[0].browser_download_url
        Write-Verbose "[$((Get-Date).TimeofDay)] $appx"
        If ($pscmdlet.ShouldProcess($appx, "Downloading asset")) {
            $file = Join-Path -path $env:temp -ChildPath $data.name
            Write-Verbose "[$((Get-Date).TimeofDay)] Saving to $file"
            Invoke-WebRequest -Uri $appx -UseBasicParsing -DisableKeepAlive -OutFile $file
            Write-Verbose "[$((Get-Date).TimeofDay)] Adding Appx Package"
            Add-AppxPackage -Path $file -ErrorAction Stop
            if ($passthru) {
                Get-AppxPackage microsoft.desktopAppInstaller
            }
        }
    }
    #Try
    Catch {
        Write-Verbose "[$((Get-Date).TimeofDay)] There was an error."
        Throw $_
    }
    Write-Verbose "[$((Get-Date).TimeofDay)] Ending $($myinvocation.mycommand)"
winget install Google.Chrome
winget install Mozilla.Firefox 
winget install NotepadPlusPlus.NotepadPlusPlus
winget install VideoLAN.VLC
winget install Zoom.Zoom
winget install TeamViewer.TeamViewer
winget install -e --id Audacity.Audacity
winget install -e --id Piriform.CCleaner
}}
else {
Write-Host "Winget is installed..."
winget install Google.Chrome
winget install Mozilla.Firefox 
winget install NotepadPlusPlus.NotepadPlusPlus
winget install VideoLAN.VLC
winget install Zoom.Zoom
winget install TeamViewer.TeamViewer
winget install -e --id Audacity.Audacity
winget install -e --id Piriform.CCleaner
}
clear 
Write-Host "All programs have been installed with no issue...."
sleep 10
Write-Host "Activing Windows 10 Pro....."
slmgr /ato


Write-Host "Starting Windows Update..."
Install-Module PSWindowsUpdate -Force
Set-ExecutionPolicy RemoteSigned
Import-Module PSWindowsUpdate
Get-WUInstall -MicrosoftUpdate -AcceptAll -AutoReboot
Write-Host "Windows Update complete!"
Write-Host "Joining NOMMA.lan domain..."
Add-Computer -DomainName NOMMA.lan
Restart-Computer
Write-Host "Domain join complete!"

