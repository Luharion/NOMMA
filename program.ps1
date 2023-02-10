# Install Google Chrome
Write-Host "Installing Google Chrome..."
Invoke-WebRequest -Uri "https://dl.google.com/chrome/install/stable/GoogleChromeStandaloneEnterprise64.msi" -OutFile "$env:TEMP\GoogleChromeStandaloneEnterprise64.msi"
Start-Process -FilePath "$env:TEMP\GoogleChromeStandaloneEnterprise64.msi" -ArgumentList "/quiet /norestart" -Wait
Remove-Item "$env:TEMP\GoogleChromeStandaloneEnterprise64.msi"

# Install Firefox
Write-Host "Installing Firefox..."
Invoke-WebRequest -Uri "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US" -OutFile "$env:TEMP\FirefoxSetup.exe"
Start-Process -FilePath "$env:TEMP\FirefoxSetup.exe" -ArgumentList "/S" -Wait
Remove-Item "$env:TEMP\FirefoxSetup.exe"

# Install Notepad++
Write-Host "Installing Notepad++..."
Invoke-WebRequest -Uri "https://notepad-plus-plus.org/repository/7.9.2/npp.7.9.2.Installer.x64.exe" -OutFile "$env:TEMP\Notepad++.exe"
Start-Process -FilePath "$env:TEMP\Notepad++.exe" -ArgumentList "/S" -Wait
Remove-Item "$env:TEMP\Notepad++.exe"

# Install Zoom
Write-Host "Installing Zoom..."
Invoke-WebRequest -Uri "https://zoom.us/client/latest/ZoomInstaller.exe" -OutFile "$env:TEMP\ZoomInstaller.exe"
Start-Process -FilePath "$env:TEMP\ZoomInstaller.exe" -ArgumentList "/S" -Wait
Remove-Item "$env:TEMP\ZoomInstaller.exe"

# Install VLC
Write-Host "Installing VLC..."
Invoke-WebRequest -Uri "https://get.videolan.org/vlc/3.0.11/win64/vlc-3.0.11-win64.exe" -OutFile "$env:TEMP\VLC.exe"
Start-Process -FilePath "$env:TEMP\VLC.exe" -ArgumentList "/L=1033 /S" -Wait
Remove-Item "$env:TEMP\VLC.exe"

# Install CCleaner
Write-Host "Installing CCleaner..."
Invoke-WebRequest -Uri "https://download.ccleaner.com/ccsetup564.exe" -OutFile "$env:TEMP\CCleaner.exe"
Start-Process -FilePath "$env:TEMP\CCleaner.exe" -ArgumentList "/S" -Wait
Remove-Item "$env:TEMP\CCleaner.exe"

Write-Host "Installation complete!"

