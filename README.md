# SonarQubeSign
Auto sign sonar .net project with powershell.


add your token to `$sonar_login`

Your Project key will be your directory name

You can sign the cert with:
```powershell
$cert = Get-ChildItem -Path Cert:\CurrentUser\My\<cert Thumprint>
Set-AuthenticodeSignature -FilePath $args[0] -Certificate $cert -IncludeChain All -TimestampServer "http://timestamp.globalsign.com/scripts/timstamp.dll"
```
