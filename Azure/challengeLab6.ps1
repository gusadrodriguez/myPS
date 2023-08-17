$resourceGroup = "PowershellRglod33191140"
$location = "eastus"
$vnetName = "ChallengeVnet"
$vmName = "Challenge-VM"
$cred = Get-Credential

$vnet = New-AZVirtualNetwor -ResourceGroupName $resourceGroup -Name $vnetName -AddressPrefix '192.168.0.0/16' -location $location
$subnetConfig = Add-AZVirtualNetworkSubnetConfig -name "FrontEnd" -AddressPrefix "192.168.1.0/24" -VirtualNetwork $vnet
$pip = New-AzPublicIpAddress -ResourceGroupName $resourceGroup -location $location -Name "challengePudDns$(Get-Random)" -allocationmethod Static -idletimeoutinminutes 5

$nsgRuleRDP = New-AzureNetworkSecurityRuleConfig -name "ChallengeRDP" -priority 500 -protocol "RDP" -direction "Inbound" -Access "allow" -sourceAddressPrefix "*" -sourcePortRange "*" -DestinationAddressPrefix "*" -DestinationPortRange "3389"
