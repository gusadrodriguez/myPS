#https://www.nakivo.com/blog/use-hyper-v-differencing-disks-complete-guide/ reference
#https://www.nakivo.com/blog/create-hyper-v-virtual-machine-complete-walkthrough/

#creates a VHD that will be used as the template VHD for $vm_Param

#set the childPath of where the file will be saved at
$VHDPath = "B:\VM_OS_VHD\VHD\"
$isoPath = "B:\VM_OS_VHD\Win11_22H2_English_x64v2.iso"
$VMPath = "B:\VM_OS_VHD\VM\"

#!!!!! we left off here - we need to fix the creation of a VHD then adding the VHD to the VM then we need to create a VHD out of the existing VM; additionally we have to have the program check if the VHD/VM exists in the files, if it does just skip to creating the other VMs
$templateVHDPath = $vhdpath + "Template.vhdx"
New-VHD -Path $templateVHDPath -Dynamic -SizeBytes "80GB"
New-VM -Name "TMPLT" -MemoryStartupBytes 4GB -BootDevice CD -Generation 2 -ComputerName "TemplateVHD" -path "B:\VM_OS_VHD\VM"  -NewVHDPath $templateVHDPath

$VMFolderContents = Get-ChildItem -Path $VMPath

foreach($vm in $VMFolderContents){
    if ($vm -eq "TemplateVHD"){
        break        
    }
    else {
        $templateVHDPath = $vhdpath + "Template.vhdx"
        New-VHD -Path $templateVHDPath -Dynamic -SizeBytes "80GB"
        New-VM -Name "TMPLT" -MemoryStartupBytes 4GB -BootDevice CD -Generation 2 -ComputerName "TemplateVHD" -path "B:\VM_OS_VHD\VM"  -NewVHDPath $templateVHDPath
    }
}


#create a template for making VMs
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

new-VM -Name "VHDTemplate" -BootDevice CD -NewVHDPath $templateVM_VHDPath  -NewVHDSizeBytes 80GB -MemoryStartupBytes 4GB -Generation 2 -ComputerName "VHDTemplate"



#boot new VM in prep for using SYSPREP to run the device and saving iso as differencing VHD
Set-VMFirmware -VMName "VHDTemplate" -FirstBootDevice VHD
Add-VMDvdDrive -VMName "VHDTemplate" -Path "C:\Path\To\Your.iso"


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