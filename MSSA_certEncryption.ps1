#Test
$Cert = Get-ChildItem -Path Cert:\CurrentUser\My -CodeSigningCert
Set-AuthenticodeSignature -FilePath .\Desktop\TestCert.ps1 -Certificate $Cert

#set & check all codes to signed
Set-ExecutionPolicy -ExecutionPolicy AllSigned
Get-ExecutionPolicy

#set & check all code is set to unrestrcited
Set-ExecutionPolicy -ExecutionPolicy Unrestricted
Get-ExecutionPolicy
