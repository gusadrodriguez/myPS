#Folders
#Create a main folder for all excel work with powershell in C:\Program Files\'Powershell Budget'
#Create Subfolders in C:..Powershell Budget\[Maj Credit Card] ... from user input for Credit Card
#Create Subfolder under Powershell Budget\[Maj Credit Card]\imports
#Display Available Folders in GUI

#GUI
#Create folder gui that allows you to see files in C:\Program Files\'Powershell Budget'
#Create ADD or REMOVE CREDIT CARDS button ... this will create the CC specific folders
#Create DONE button to close prompt
#Create GUI to select desired file to convert in the Raw Imports folder

#Impliment edits with Code & Save file with naming conventions by user $budgetDate = (MO/MON/YEAR) [Insert Maj Credit Card ALL CAPS]05/May/2023
Install-Module -Name ImportExcel -Force

$statementName = "Amex 04 Apr 23.csv"
$statementPath = "A:\00 - gusadrodriguez (personal cloud)\02 - Finances\01 - Monthly Budgets\BUDGETS 2023\Working Budgets\$statementName"

$rawCSV =  Import-Csv -Path $statementPath -Delimiter ','



#variable for # of columns, array & for loop to add titles of columns into an array 
#consider using Objects in future
[int]$columns = Read-Host "enter columns separated by comma"
$columnArray = @()
for ($i = 0; $i -le $columns-1; $i++) {
    $columnName = read-host "input column name" 
    $columnArray += $columnName
}

#will converthis further into an irratable object where the names of the columns become their own property value
ForEach($item in $rawCSV) {
    ForEach($title in $columnArray){
      $emptyData = ''
      $title | Add-Member -NotePropertyName "Category" -NotePropertyValue $emptyData
    }
}

$rawCSV | Export-Csv '.\ExportTest.csv'

ForEach($item in $rawCSV) {
    $column4val = ''
    $item | Add-Member -NotePropertyName "Category" -NotePropertyValue $column4val
  
    $column5val = ''
    $item | Add-Member -NotePropertyName "Account" -NotePropertyValue $column5val
  }
  $rawCSV | Export-Csv '.\ExportTest.csv'

# Import-CSV -Path $statementImportPath | Out-GridView
$data = Import-Csv -Path $statementPath -Delimiter ',' 
#$hashtable = [ordered]@{"Date" = ($data).Date.format
$data | Get-Member
$finaldata = $data | Where-Object {$_.Amount -gt 100}


Import-Csv 
 




# Specifies a path to one or more locations. Unlike the Path parameter, the value of the LiteralPath parameter is
# used exactly as it is typed. No characters are interpreted as wildcards. If the path includes escape characters,
# enclose it in single quotation marks. Single quotation marks tell Windows PowerShell not to interpret any
# characters as escape sequences.


#New-Item -Path $excelPath -ItemType File
#New-Item -Path "C:\Program Files\Powershell Budget\$credCardAdd\Imports" -Type Directory


