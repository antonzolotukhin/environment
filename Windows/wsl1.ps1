# https://docs.microsoft.com/en-us/windows/wsl/install-on-server
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
# Now you need to reboot and run script again

iwr https://aka.ms/wsl-debian-gnulinux -OutFile Debian.appx
Add-AppxPackage .\Debian.appx

wsl -s Debian
wsl

# TODO: Add wsl shell-prompt settings