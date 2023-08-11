$hard_Disk_Array = @(
    $hd_Disk_Format,
    $hd_Disk_Type,
    $hd_Name,
    $hd_File_Path,
    $vm_Configure_Disk,
    $vm_OS_Image
)

#consider: creating swtiches to take input for items with more than one option
#consider: 

foreach ($hd_item in $hard_Disk_Array) {
    Write-Host "Please Enter a Value for: $hd_item"
    read-host $input
    $hd_item = $input
}