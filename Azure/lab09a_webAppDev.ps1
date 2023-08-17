git clone https://github.com/Azure-Samples/php-docs-hello-world
Set-Location -Path $HOME/php-docs-hello-world/
git remote add [deployment_user_name] [git_clone_url]
git push [deployment_user_name] master

$rgName = 'az104-09a-rg1-lod33215902'

$webapp = Get-AzWebApp -ResourceGroupName $rgName

while ($true) { Invoke-WebRequest -Uri $webapp.DefaultHostName } #INFINITE LOOP HTTP REQUEST