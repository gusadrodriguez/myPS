Install-Module -Name ImportExcel -Force
$sourceFolder = "A:\00 - gusadrodriguez (personal cloud)\02 - Finances\01 - Monthly Budgets\BUDGETS 2023\Working Budgets\"
$csvName = "amextester.csv"
$csvFile = "$sourceFolder\$csvName"
$xlsxFile = "output.xlsx"

$rawCSV =  Import-Csv -Path $csvFile -Delimiter ','

[int]$numColumns = Read-Host "enter columns separated by comma"

$columnArray = @()
$emptyData = ''
for ($i = 0; $i -le $numColumns-1; $i++) {
    $columnName = read-host "input column name" 
    $columnArray += $columnName
}

ForEach($item in $rawCSV) {  
    $count = 0
    $item | Add-Member -MemberType NoteProperty -Name $columnArray[$count] -Value $emptyData
    $count++
}


$rawCSV | Export-Csv '.\ExportTest1.csv'

$excel = New-Object -ComObject Excel.application
$workbook = $excel.workbooks.Open($csvFile)
$workbook.SaveAs($xlsxFile, 51)
$workbook.close()
$excel.Quit()