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




