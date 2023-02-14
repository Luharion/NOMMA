slmgr.vbs /ipk 
Add-AppXPackage -Path .\MicrosoftDesktopAppInstaller_8wekyb3d8bbwe.msixbundle
clear 
Write-Host "Winget is installed..."
sleep 30
winget install Google.Chrome
winget install Mozilla.Firefox 
winget install NotepadPlusPlus.NotepadPlusPlus
winget install VideoLAN.VLC
winget install Zoom.Zoom
winget install TeamViewer.TeamViewer
winget install -e --id Audacity.Audacity
winget install -e --id Piriform.CCleaner
clear 
Write-Host "All programs have been installed with no issue...."
sleep 30
Write-Host "Activing Windows 10 Pro....."
slmgr /ato
clear
sleep 30
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
clear


