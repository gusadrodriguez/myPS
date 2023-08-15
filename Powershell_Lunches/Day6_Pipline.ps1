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

#LAB

#Make two text files with different text, use COMPARE cmdlet 

New-Item -ItemType File -Path C:\Users\gusta\Documents\TestText1.txt 
New-Item -ItemType File -Path C:\Users\gusta\Documents\TestText2.txt 

Set-Content -path C:\Users\gusta\Documents\TestText2.txt "testing 1"
Set-Content -path C:\Users\gusta\Documents\TestText1.txt "testing 2"

Compare-Object -ReferenceObject (Get-Content -path C:\Users\gusta\Documents\TestText1.txt) -difference (Get-Content -path C:\Users\gusta\Documents\TestText2.txt)

#Run Get-Command |Export-CSVcommands.csv |out-file
Get-Command | Export-Csv commands.csv | Out-File -FilePath C:\Users\Default\Desktop
<# It will not work because the native permission on windows will not allow direct write to directories#>

#How can you run Stop-Job
Get-Help Stop-Job -ShowWindow

<#there are several examples showing in the Get-Help section#>

#Get a CSV file delimited by the pipeline | char
Get-Help Export-Csv -ShowWindow
Get-Process | Export-Csv -Path ".\csvfile.csv" -Delimiter "|" -Force
Get-Content .\csvfile.csv

#Get the type information in the comments section of the command promp in the CSV
Get-Process | Export-Csv -Path ".\csvfile.csv" -Delimiter "|" -Force -IncludeTypeInformation
Get-Content .\csvfile.csv

#What parameters prvent you from overwriting a file with CLIXML and CSV
Get-Help Export-Clixml -ShowWindow
Get-Help Export-CSV -ShowWindow

<# -NoClobber <System.Management.Automation.SwitchParameter>
        Indicates that the cmdlet doesn't overwrite the contents of an existing file. By default, if a file exists in the specified path, `Export-Clixml` overwrites the file without warning.#>

<#-NoClobber <System.Management.Automation.SwitchParameter>
        Use this parameter so that `Export-CSV` does not overwrite an existing file. By default, if the file exists in the specified path, `Export-CSV` overwrites the file without warning.#>


<#
    -Confirm <System.Management.Automation.SwitchParameter>
        Prompts you for confirmation before running the cmdlet.
#>


#how can you change the default delimeter or use the default delimeter in an Export-CSV file
Get-Help Export-Csv

<#-UseCulture <System.Management.Automation.SwitchParameter>
Uses the list separator for the current culture as the item delimiter. To find the list separator for a culture, use the following command: `(Get-Culture).TextInfo.ListSeparator`.#>