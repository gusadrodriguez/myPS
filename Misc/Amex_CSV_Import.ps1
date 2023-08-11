#projects will be stored in a projects folder in the Git directory
#when completed files will be uploaded to GitHub finalized products with versioning
$csvPath = "C:\Program Files\Git\Projects\amextester.csv"
$csvData = Import-Csv -Path $csvPath -Delimiter ","

#make inputs to arrayList continue until the user hits any letter but "y" 
$arrayContinue = "y"

$columnArrayList = New-Object System.Collections.ArrayList

#takes the users input to add column names to an array list
do {
    $addColumn = Read-Host "enter column name"
    $columnArrayList += $addColumn
    Write-Host $columnArray
    $arrayContinue = read-host "Continue Y or N"
}
while ($arrayContinue -eq "y")

#add the column with their names to the existing CSV file
foreach ($column in $columnArrayList) {
    $csvData | ForEach-Object {
        $_ | Add-Member -MemberType NoteProperty -Name $column -Value $null
    }
}

#exports the edited CSV to a standalone file named CSVExport that will be translated to XLSX format
$csvData | Export-Csv -Path "C:\Program Files\Git\Projects\CSVExport.csv" -NoTypeInformation