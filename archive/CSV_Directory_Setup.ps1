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

$excelFile = "Amex 04 Apr 23 - Copy" #will use Read-Host "Enter the name of your Excel File" in the future
$excelPath = "C:\Users\Test\Desktop\02 - Finances\01 - Monthly Budgets\BUDGETS 2023\Working Budgets\$excelFile"

$creditCardArray = '[]' #consider converting to hashtable
$budgetFolder = "C:\Program Files\Powershell Budget"


if(Test-Path -Path $budgetFolder -PathType Container) {
    Write-Host "Folder exists" -f Green
}
else{
    Write-Host "Folder Does Not Exist - Please standby as we create one" -f Red
    New-Item -Path $budgetFolder -Type Directory
}

#checking for CC & adding if it does not exist, creating separate folder with import as well
Write-Host "Would you like to add a credit card folder?"
$ccAdd = Read-Host "if yes Type (Y) if no (N)"
if($ccAdd -eq "Y") 
{
    $credCardAdd = Read-Host "Please input a credit card name"
    
    if (-not($credCardAdd -in $creditCardArray))
    {
        $credCardFolder = "C:\Program Files\Powershell Budget\$credCardAdd"
        $creditCardArray += $credCardAdd
        New-Item -Path $credCardFolder -Type Directory
        New-Item -Path "C:\Program Files\Powershell Budget\$credCardAdd\Imports" -Type Directory
        #create a "Converted Imports" files directory
        #create a "Completed" files directory
        #consider creating these as a group
    }

    else{
        Write-Host "Card Already Exists"
    }
}


#$excel = New-Object -Com Excel.application
#$importFile = "C:\Users\Test\Desktop\02 - Finances\01 - Monthly Budgets\BUDGETS 2023\Working Budgets\Amex 04 Apr 23.csv"

#write-Host  $importFile
#Open importfile for edit.

#$wb = $excel.workbooks.Open($importfile)

#Write-Host $wb

#New-Object -ComObject
