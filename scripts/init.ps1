Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
Set-Prompt
Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck

'
chcp 65001 #utf8
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox
$ThemeSettings.PromptSymbols.UNCSymbol=[char]::ConvertFromUtf32(0x26B6)
$ThemeSettings.PromptSymbols.VirtualEnvSymbol=[char]::ConvertFromUtf32(0x13C9)
' | Out-File $PROFILE -Append
