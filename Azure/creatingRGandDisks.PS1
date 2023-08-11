Creating a Resource Group & Updating DISK & SKU

#creates a resource group

$location = (Get-AzResourceGroup -Name az104-03b-rg1).Location
$rgName = 'az104-03c-rg1'
New-AzResourceGroup -Name $rgName -Location $location

#check the RG
Get-AzResourceGroup -Name $rgName

#create a new managed disk
$diskConfig = New-AzDiskConfig `
-Location $location `
-CreateOption Empty `
-DiskSizeGB 32 `
-Sku Standard_LRS

$diskName = 'az104-03c-disk1'

New-AzDisk `
-ResourceGroupName $rgName `
-DiskName $diskName `
-Disk $diskConfig

# check the disk
Get-AzDisk -ResourceGroupName $rgName -Name $diskName

#update the disk 64 GIB
New-AzDiskUpdateConfig -DiskSizeGB 64 | Update-AzDisk -ResourceGroupName $rgName -DiskName $diskName

#check the disk for the update
Get-AzDisk -ResourceGroupName $rgName -Name $diskName

#check the current SKU
(Get-AzDisk -ResourceGroupName $rgName -Name $diskName).Sku

#update sku
New-AzDiskUpdateConfig -Sku Premium_LRS | Update-AzDisk -ResourceGroupName $rgName -DiskName $diskName

#verify sku update
(Get-AzDisk -ResourceGroupName $rgName -Name $diskName).Sku
