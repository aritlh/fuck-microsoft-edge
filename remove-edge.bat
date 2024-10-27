@echo off
echo Stopping Microsoft Edge processes...
taskkill /F /IM msedge.exe /T

echo Uninstalling Microsoft Edge...
PowerShell -Command "Get-AppxPackage -AllUsers Microsoft.MicrosoftEdge | Remove-AppxPackage -ErrorAction SilentlyContinue"
PowerShell -Command "Get-AppxPackage -AllUsers Microsoft.MicrosoftEdge.ShellExperienceHost | Remove-AppxPackage -ErrorAction SilentlyContinue"
PowerShell -Command "Get-AppxPackage -AllUsers Microsoft.MicrosoftEdge.Stable | Remove-AppxPackage -ErrorAction SilentlyContinue"

echo Removing Edge folders...
rmdir /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data"
rmdir /s /q "%APPDATA%\Microsoft\Edge\User Data"
rmdir /s /q "%PROGRAMFILES%\Microsoft\Edge\Application"
rmdir /s /q "%PROGRAMFILES(x86)%\Microsoft\Edge\Application"
rmdir /s /q "%SYSTEMROOT%\SystemApps\Microsoft.MicrosoftEdge_*"

echo Restarting the computer...
shutdown /r /t 5
