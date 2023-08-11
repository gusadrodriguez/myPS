$PSVersionTable

#install Help- commands using Update-Help

#Test get Help with Get-Item after install
Get-Help Get-Item

#Running without specififed path to test theory of mandatory parameters
Get-Item

#Check full help to view positional parameters & mandatory params

Get-Help Get-Item -Full

#See the same files as above but on a browser using the -OnLine param

Get-Help Get-ITem -Online

#use examples option
Get-Help Get-Item -Examples

#using wild cards *

Get-Help *Common*

#try with About-

Get-Help about_*ps

#Find cmdlets capable of converting other cmldets into html
Get-Command ConvertTo-Html

#find redirect output into a file
GEt-help *redirect*
Out-Fil
#how many cmdlets are available for workiing with processes? Total = 14
Get-Command *Process*

#What cmdlet might you use to set to a Poweshell breakpoint? Set-PSBreakpoint
Get-Command *breakpoint*
Get-Help -Name Set-PSBreakpoint

#What cmdlets are aavailable to create, modify, export, or import aliases? Get-Command *alias* provides the answer
Get-Command *alias*
Get-Alias #this will let you see all available aliases#

#How do you save a transpcript of shell into a textfile? Start-Transcript
Get-Command *transcript*

#How can you get a processes by the name of the process? Get-Process -Name [insert string] 
Get-help Get-Process

#How about to tell you the user who started the process? Get-Process pwsh -IncludeUserName ... this is an example
Get-Help Get-Process -Examples

#how do you run a process on a remote client? Invoke-Command
Get-Command *invoke*

#Examine the Get-Help file for the Out-File cmdlet? what is the max width and how do you change it? 
<#    
-Width <System.Int32>
        Specifies the maximum number of characters in each line of output. Any additional characters are truncated, not wrapped.
         If this parameter isn't used, the width is determined by the characteristics of the host. The default for the PowerShell console is 80 characters.
          If you want to control the width for all invocations of `Out-File` as well as the redirection operators (`>` and `>>`), set `$PSDefaultParameterValues['out-file:width'] = 2000` before using `Out-File`.

        Required?                    false
        Position?                    named
        Default value                None
        Accept pipeline input?       False
        Accept wildcard characters?  false
#>

Get-Help Out-File -ShowWindow

#How about preventing overwriting with Out-File? -NoClobber
<#
    -NoClobber <System.Management.Automation.SwitchParameter>
        NoClobber prevents an existing file from being overwritten and displays a message that the file already exists. By default, if a file exists in the specified path, `Out-File` overwrites the file without warning.

        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       False
        Accept wildcard characters?  false 
        #>

# What is the command of all aliases in PS?
Get-Alias

#Use alias and abbreviated parameter name to get shortest command line to retrieve a list of commands with the word process in the name? gcm *proc*
gcm *proc*

#How many cmdlets help deal with generic objects?
Get-Command *object*
<#Cmdlet          Compare-Object                                     7.0.0.0    Microsoft.PowerShell.Utility
Cmdlet          ForEach-Object                                     7.3.6.500  Microsoft.PowerShell.Core
Cmdlet          Group-Object                                       7.0.0.0    Microsoft.PowerShell.Utility
Cmdlet          Measure-Object                                     7.0.0.0    Microsoft.PowerShell.Utility
Cmdlet          New-Object                                         7.0.0.0    Microsoft.PowerShell.Utility
Cmdlet          Register-ObjectEvent                               7.0.0.0    Microsoft.PowerShell.Utility
Cmdlet          Select-Object                                      7.0.0.0    Microsoft.PowerShell.Utility
Cmdlet          Sort-Object                                        7.0.0.0    Microsoft.PowerShell.Utility
Cmdlet          Tee-Object                                         7.0.0.0    Microsoft.PowerShell.Utility
Cmdlet          Where-Object                                       7.3.6.500  Microsoft.PowerShell.Core#>

#What help topic could tell you more about arrays?
Get-Help about_Arrays