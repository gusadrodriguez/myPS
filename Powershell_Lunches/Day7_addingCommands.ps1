Install-Module Az

#see if module installed
Get-Module -Name *
Get-Module az -ListAvailable

#use update module to update the modules
Update-Module 

#get the living path of all modules using PSModulePath
(Get-Content Env:/PSmodulepath) -split ':'

#add modules paths by the following:
$env:PSmodulepath += [System.IO.Path]::PathSeparator +C;\Scripts/mymodules

#how to add prefix to module to avoid conflicts
Import-Module ModuleName -Prefix [insert here]

#find a command that will let you zip a text file you create
help *-archive
get-command -module Microsoft.PowerShell.Archive
Get-Help Compress-Archive

'test lunch' | Out-File Chapter7.txt
Compress-Archive -Path .\Chapter7.txt -DestinationPath .\Chapter7.zip
Compress-Archive -Path .\Chapter7.txt -DestinationPath .\Chapter7.zip -force -verbose

#lab

#install a powershell gallery module
Install-Module -name ImportExcel

#browse the available commands for the module
Get-Module ImportExcel -ListAvailable
Get-Help -name Import-Excel

#install the latest Compress-Archive module
Install-Module Microsoft.powershell.Archive
Update-Module -name Microsoft.Powershell.Archive
Help *-archive -ShowWindow

#create 10 file in a folder
Cd .\TestFolder
$testItems = 10
for ($i = 1; $i -le $testItems; $i++){
    "TestDoc$i" | out-file TestItem$i.txt
}

Get-help expand-*

Expand-Archive -path .\TestFolder.zip -DestinationPath .\TestFolder2 
$folder1 = Get-ChildItem -path 'C:\Program Files\Git Repositories\MSSAProject\TestFolder\' | Select-Object -ExpandProperty Name
$folder2 = Get-ChildItem -path 'C:\Program Files\Git Repositories\MSSAProject\TestFolder2\TestFolder\' | Select-Object -ExpandProperty Name
Compare-Object -ReferenceObject $folder11 -DifferenceObject $folder2