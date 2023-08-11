#Version: will create a ISO based vm
$vm_array = @(
    $vm_Name,
    $vm_StoragePath,
    $vm_Gen,
    $vm_Mem,
    $vm_DynMemSwitch,
    $vm_ConnectNetwork,
    $vm_RAM,
    #$vm_ConnectVHDOption,
    $vm_OSImagePath
)

#will change to receiving input from CSV in future
foreach ($vm_entry in $vm_array) {
      Read-Host "Please enter a value for: $input"
      $vm_entry = $input
}

$vm_Param = @{
    "vm_Name" = $vm_Name
    "vm_storagePath" = $vm_StoragePath
    "vm_Gen" = $vm_Gen
    "vm_Mem" = $vm_Mem
    "vm_RAM" = $vm_RAM
    "vm_DynMemSwitch" = $vm_DynMemSwitch
    "vm_Ntwk" = $vm_ConnectNetwork
    "vm_OS_Image" = $vm_OSImagePath
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