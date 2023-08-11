#Get the path to the projects folder & the existing CSV
$path = "C:\Program Files\Git\Projects"

$csvPath = "$path\CSVExport.csv"
$csvData = Import-Csv -Path $csvPath 

#Create a new excel file COM Object & create a workbook within the file and a single worksheet named "worksheet"
$excelObj = New-Object -ComObject excel.application 
$workbook = $excelObj.workbooks.Add()
$worksheet = $workbook.worksheets.Item(1)
#variable for file name
$excelExportFile = "$path\ExcelExport.xlxs"

#variables to set the foreach loops to start at row 1, column 1 of the excel file being created
$row = 1
$column = 1

#copies the headers to each column
foreach ($header in $csvData[0].PSobject.Properties.name){
    $worksheet.Cells.Item($row, $column) = $header
    $column++
}

#sets row to row 2, and resets column to column 1 ----> row 2, column 1 start position
$row++
foreach ($item in $csvData) {
    $column = 1
#goes through the properties in the $csvData csv     
    foreach ($property in $item.PSobject.Properties) {
        $value = $property.Value
        $worksheet.Cells.Item($row, $column) = $value
        $column++
    }

}

$workbook.SaveAs($excelExportFile)
$excelObj.Quit()


