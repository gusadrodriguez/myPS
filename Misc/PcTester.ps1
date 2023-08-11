$csvPath = "C:\Program Files\Git\Projects\amextester.csv"
$csvData = Import-Csv -Path $csvPath -Delimiter ","

$arrayContinue = "y"

$columnArrayList = New-Object System.Collections.ArrayList

do {
    $addColumn = Read-Host "enter column name"
    $columnArrayList += $addColumn
    Write-Host $columnArray
    $arrayContinue = read-host "Continue Y or N"
}
while ($arrayContinue -eq "y")

foreach ($column in $columnArrayList) {
    $csvData | ForEach-Object {
        $_ | Add-Member -MemberType NoteProperty -Name $column -Value $null
    }
}

$csvData | Export-Csv -Path "C:\Program Files\Git\Projects\export.csv" -NoTypeInformation


























#CSV to XLS
$csvName = "amextester.csv"
$xlxsName = "amextesterX.xlsx"
$sourceFolder = "A:\00 - gusadrodriguez (personal cloud)\02 - Finances\01 - Monthly Budgets\BUDGETS 2023\Working Budgets\"
$csvFile = "$sourceFolder\$csvName"
$xlsxFile = "$sourceFolder\$xlxsName"
$delimiter =  ","

$excel = New-Object -ComObject excel.application
$workbook = $excel.workbooks.add(1)
$worksheet = $workbook.worksheets.item(1)

$txtConnector = ("TEXT;" + $csvFile)
$Connector = $worksheet.QueryTables.add($txtConnector, $worksheet.Range("A1"))
$query = $worksheet.QueryTables.item($Connector.name)
$query.TextFileOtherDelimiter = $delimiter
$query.TextFileParseType = 1
$query.TextFileColumnDataTypes = ,2 *
$worksheet.Cells.Columns.Count 
$query.AdjustColumnWidth = 1

$query.Refresh()
$query.Delete()

$Workbook.SaveAs($xlsx, 51)
$excel.Quit()


