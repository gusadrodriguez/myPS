New-ADOrganizationalUnit -Name London -Path 'dc=adatum, dc=com'
New-ADgroup -Name 'London Admins' -GroupScope Global
New-ADUser -Name 'Ty Carlson'
Add-ADGroupMember -Identity 'London Admins' -Members 'Ty Carlson'

New-ADComputer -Name 'Lon-CL2'

# move user to new domain

Move-ADObject -Identity 'Cn=Ty Carlson,CN=Users,DC=Adatum, DC=com' -TargetPath 'OU=London,DC=adatum,DC=com'

#or you can simplify this entire process by doing the below...


$GrpToMove = Get-AdGroup -Identity 'London Admins'
$tgtPath = Get-ADOrganizationalUnit -filter {Name -eq 'London'}
Move-ADObject -Identity $GrpToMove.DistinguishedName -TargetPath $tgtPath.DistinguishedName

$ObjToMove = Get-AdComputer -Identity 'Lon-Cl2'
$tgtPath = Get-ADOrganizationalUnit -filter {Name -eq 'London'}
Move-ADObject -Identity $ObjToMove.DistinguishedName -TargetPath $tgtPath.DistinguishedName

#check results
Get-ADObject -SearchBase $tgtPath.DistinguishedName -filter *


Get-help Move-ADObject -ShowWindow

Get-command *ad*
    
