# https://docs.microsoft.com/en-us/windows/wsl/install-manual
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -All -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -All -NoRestart

iwr https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi -OutFile wsl_update_x64.msi

./wsl_update_x64.msi

wsl --set-default-version 2

iwr https://aka.ms/wsl-debian-gnulinux -OutFile Debian.appx
Add-AppxPackage .\Debian.appx

wsl -s Debian
wsl

# TODO: Add wsl shell-prompt settings