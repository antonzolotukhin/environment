
# Create profile when not exist
if (!(Test-Path -Path $PROFILE.CurrentUserAllHosts)) {
  New-Item -ItemType File -Path $PROFILE.CurrentUserAllHosts -Force
}

# Install Scoop
# https://scoop.sh/
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
iwr -useb get.scoop.sh | iex

# Install strarship
# https://starship.rs/
scoop install starship
Write-Output  "Invoke-Expression (&starship init powershell)" | Out-File $PROFILE.CurrentUserAllHosts -Append -Encoding utf8

# Install Nerd Fonts
scoop install sudo
scoop bucket add nerd-fonts
sudo scoop install JetBrainsMono-NF

# Install Terminal
# get latest release download url via github API
$release = (
    (irm https://api.github.com/repos/microsoft/terminal/releases/latest).assets |
            Select-Object -Property "name", "browser_download_url" |
            Where-Object -Property "name" -Match "\.msixbundle`$"
)
iwr $release.browser_download_url  -OutFile $release.name
Add-AppxPackage $release.name
