# Create profile when not exist
if (!(Test-Path -Path $PROFILE.CurrentUserAllHosts)) {
  New-Item -ItemType File -Path $PROFILE.CurrentUserAllHosts -Force
}

# Install Scoop
# https://scoop.sh/
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
iwr -useb get.scoop.sh | iex

# Bash Auto-completion
Install-Module -Name PSBashCompletions -Scope CurrentUser
$CompletionsDir = (Join-Path (gi $PROFILE.CurrentUserAllHosts).Directory completions)
mkdir $CompletionsDir

# Install kubectl
scoop install kubectl
# kubectl completion
$kubectlCompletions = (Join-Path $CompletionsDir "kubectl_completions.sh")
kubectl completion bash | Out-File $kubectlCompletions
Write-Output  "Register-BashArgumentCompleter `"kubectl`" `"$kubectlCompletions`"" | Out-File $PROFILE.CurrentUserAllHosts -Append -Encoding utf8
