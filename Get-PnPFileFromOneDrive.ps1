#$cred = Get-Credential
#Connect-PnPOnline -Url "https://simedev-my.sharepoint.com/personal/koskila_simedev_onmicrosoft_com/" -Credentials $cred
Connect-PnPOnline -Url "https://simedev-my.sharepoint.com/personal/koskila_simedev_onmicrosoft_com/" -AppId "" -AppSecret ""
Set-PnPTraceLog -Level "debug" -On
$f = Get-PnPFile -Url "/Documents/vlad.jpg" -AsFile
