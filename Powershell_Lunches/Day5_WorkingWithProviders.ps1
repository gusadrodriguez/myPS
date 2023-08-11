#create a new directory called Labs
New-Item -Path C:\Users\gusta\Documents -ItemType Directory -Name "Labs"

#create a zero length file called /Labs/Test.Txt
New-Item -Path C:\users\gusta\Documents\Labs -ItemType File -Name "Test.Txt"

#Is it possible to set the contents of Test.Txt to -TESTING with Set-Item? if not why
Get-Help Set-Item -ShowWindow
Set-Item -Path C:\Users\gusta\Documents\Labs\Test.Txt #wont work because the parameter -TESTING is not available

#Using the Environment provider, display the value of the system environment variable PATH.
Get-ChildItem Env:PATH

#use help to display the difference between -Filter and -Include , -Exclude with Get-ChildItem
Get-Help Get-ChildItem -ShowWindow

