#set region & RG

$location = 'eastus'
$rgName = 'az104-06-rg1'
New-AzResourceGroup -Name $rgName -Location $location

#create vm's

New-AzResourceGroupDeployment `
  -ResourceGroupName $rgName `
  -TemplateFile $HOME/az104-06-vms-loop-template.json `
  -TemplateParameterFile $HOME/az104-06-vms-loop-parameters.json

#installs network watcher
$rgName = 'az104-06-rg1'
$location = (Get-AzResourceGroup -ResourceGroupName $rgName).location
$vmNames = (Get-AzVM -ResourceGroupName $rgName).Name

foreach ($vmName in $vmNames) {
 Set-AzVMExtension `
 -ResourceGroupName $rgName `
 -Location $location `
 -VMName $vmName `
 -Name 'networkWatcherAgent' `
 -Publisher 'Microsoft.Azure.NetworkWatcher' `
 -Type 'NetworkWatcherAgentWindows' `
 -TypeHandlerVersion '1.4'
}

#resource ID for vnet2
/subscriptions/136f4ded-5324-4493-9295-f4143768904e/resourceGroups/az104-06-rg1/providers/Microsoft.Network/virtualNetworks/az104-06-vnet2

#resource ID for vnet3
/subscriptions/136f4ded-5324-4493-9295-f4143768904e/resourceGroups/az104-06-rg1/providers/Microsoft.Network/virtualNetworks/az104-06-vnet3

#run PS script to allow RRAS
Install-WindowsFeature RemoteAccess -IncludeManagementTools

#install routing role
Install-WindowsFeature -Name Routing -IncludeManagementTools -IncludeAll
