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

$cardType = Read-Host "Please enter the card type ex. AMEX"
$statementYear = Read-Host "please enter 2 digit year for the imported credit card statement ex. 23"
$statementMonth = Read-Host "please enter a month for the credit card statement in the selection menu in two digit format ex. 01 for January"

$monthArray = @{
    Jan = "01JAN"
    Feb = "02FEB"
    Mar = "03MAR"
    Apr = "04APR"
    May =  "05MAY"
    Jun = "06JUN"
    Jul = "07JUL"
    Aug = "08AUG"
    Sep = "09SEP"
    Oct = "10OCT"
    Nov = "11NOV"
    Dec = "12DEC"
}

$monthArray

$credCardFileName = $monthArray[$statementMonth]+$statementYear+$cardType

$credCardFileName

$statementName = "Amex 04 Apr 23.csv"
$statementImportPath = "A:\00 - gusadrodriguez (personal cloud)\02 - Finances\01 - Monthly Budgets\BUDGETS 2023\Working Budgets\$statementName"

$test = Import-Csv -Path $statementImportPath | Where-Object {$_.Amount -lt 0} 
$test


# Specifies a path to one or more locations. Unlike the Path parameter, the value of the LiteralPath parameter is
# used exactly as it is typed. No characters are interpreted as wildcards. If the path includes escape characters,
# enclose it in single quotation marks. Single quotation marks tell Windows PowerShell not to interpret any
# characters as escape sequences.


#New-Item -Path $excelPath -ItemType File
#New-Item -Path "C:\Program Files\Powershell Budget\$credCardAdd\Imports" -Type Directory


