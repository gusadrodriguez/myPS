#run these processes and see their results
Get-Process
Get-Command
Get-History -count 10

#export to CSV using pipeline
Get-Process | Export-CSV procs.CSV

#convert processes to a JSON file
Get-Process | ConvertTo-JSON | Out-File procs.json

#convert processes to an XML file and back to a PSHW
Get-process | Export-Clixml proces.xml
Import-Clixml .\proces.xml

#find import or export commands
Get-Command -Verb import
Get-Command -Verb export

#run compare-object and look at referenceobject, differenceobject, and property
Get-help Compare-Object -ShowWindow

#find the parameter that extends outfile to more than 80 characters
Get-Help Out-File

#find other out type of commands
Get-Command -Verb Out

#try to put processes into a HTML file
Get-Process | ConvertTo-Html  # this only gets the code
Get-Process | ConvertTo-Html | Out-file process.html #this gets the code into a readable file

#
