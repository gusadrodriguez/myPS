
Set-Executionpolicy -executionpolicy remotesigned

Install-Module -name Az --verbose -AllowClobber -force

Import-Module Az

connect-azaccount

multiple subscriptions - use set-azcontext

New-AzResourceGroup -Name RG2 -Location eastus

 .\azdemo.ps1 rg2
Content of script below: Save as *.ps1

# capture the input parameter in a variable

param([string]$resourceGroup)

# prompt for a username and password for the VMs admin account

# and capture the result in a variable

$adminCredential = Get-Credential -Message "Enter a username and password for the VM administrator."

 

# Add a loop that executes three times to create a new VM for each loop iteration

For ($i = 1; $i -le 3; $i++)

{

    # create a name for each VM, store it in a variable and output it to the console

    $vmName = "AzDemo" + $i

    Write-Host "Creating VM: " $vmName

 

    # create a VM using the $vmName variable

    New-AzVm -ResourceGroupName $resourceGroup -Name $vmName -Credential $adminCredential -Image UbuntuLTS

}