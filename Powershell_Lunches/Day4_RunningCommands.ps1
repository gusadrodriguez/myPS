<# DIsplay a list of running processes#>
Get-Process

#Test the conneciton to google.com or bing.com without using an externam command like ping
Test-Connection google.com

#Display a list of all command sthat are of the cmdlet type
Get-Help *type*
Get-Command * | Format-List
Get-command * | Where-Object -Property "CommandType" -eq "cmdlet"

#display a list of all aliases
Get-Alias *

#Make a new alias so that you can run ntst to run netstat
Get-Help *alias*
Get-help New-Alias -Examples
New-Alias -Name "ntst" -Value netstat

#Display a list of processes that begin with the letter p
Get-Process -Name p*

#Make a new folder using the New-Item cmdlet with the name of MyFolder1 & MyFolder2
Get-Help new-item
Get-Help new-item -Examples
New-Item C:\Users\gusta\Documents -Name "MyFolder1" -ItemType "directory"
New-Item C:\Users\gusta\Documents -Name "MyFolder2" -ItemType "directory"

#Remove the items from above
Get-Help *remove*
Get-Help Remove-Item
Remove-Item -Path C:\Users\gusta\Documents\MyFolder1, C:\Users\gusta\Documents\MyFolder2
