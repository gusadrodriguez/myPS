#https://www.nakivo.com/blog/use-hyper-v-differencing-disks-complete-guide/ reference
#https://www.nakivo.com/blog/create-hyper-v-virtual-machine-complete-walkthrough/

#creates a VHD that will be used as the template VHD for $vm_Param

$templateVM_VHDPath =  "B:\OS_VHD_ISO\VHD\"
$templateVM_isoPath =  "B:\OS_VHD_ISO\Win11_22H2_English_x64v2.iso"
new-VM -Name "VHDTemplate" -BootDevice CD -NewVHDPath $templateVM_VHDPath  -NewVHDSizeBytes 80GB -MemoryStartupBytes 4GB -Generation 2 -ComputerName "VHDTemplate"

#boot new VM in prep for using SYSPREP to run the device and saving iso as differencing VHD
Set-VMFirmware -VMName "MyVM" -FirstBootDevice VHD
Add-VMDvdDrive -VMName "MyVM" -Path "C:\Path\To\Your.iso"









#The amount of clients to create
$vm_ClientCount = 2

#Array containing variables that will be used as parameters in the $vm_Param hashtable
$vm_array = @(
    $vm_Name,
    $vm_ComputerName,
    $vm_Gen,
    $vm_RAMSize,
    $vm_HDDSize,
    $vm_VHDPath,
    $vm_VHDStorePath,
    $vm_Switch
)

#will change to receiving input from CSV in future
foreach ($vm_entry in $vm_array) {
      Read-Host "Please enter a value for: $input"
      $vm_entry = $input
}

#Hashtable that will build VM
$vm_Param = @{
    "Name" = $vm_Name
    "ComputerName" = $vm_ComputerName
    "Generation" = $vm_Gen
    "MemoryStartUpBytes" = $vm_RAMSize
    "NewVHDSizeBytes" = $vm_HDDSize
    "VHDpath" = $vm_VHDPath
    "Path" = $vm_VHDStorePath
    "SwitchName" = $vm_Switch
}

#Connect Virtual Hard Disk Option
<#
#1 VHD - creates dynamic expanding vhd (VHDX)
 variables:
 ----------
 $name
 $location
 $size

 #2 use an existing virtual hard disk at a path
variables
----------
 $location

 #3 attach a virutual hard disk later
 make this an "else" which will make the item true by default
 #>


 <# 
 Installation Options
 #1 Install later "else"

 #2 Install from bootable media
 variables
 --------
 $physicalDrive = 
 $imagePath =

 #3 Install from floppy
 $vfdPath = 

  #>