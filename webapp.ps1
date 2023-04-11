$location = "eastus"
$rgname = 'webapptest'

New-AzResourceGroup -Location $location -Name $rgname

$appserviceplanname = "pythonflashwebappserviceplan"

New-AzAppServicePlan -Location $location -Name $appserviceplanname -Tier Basic -Linux -ResourceGroupName $rgname

$webappname = (Get-AzWebApp).Name

$setting = @{'SCM_DO_BUILD_DURING_DEPLOYMENT'='True'}
Set-AzWebApp -AppSettings $setting -Name $webappname -ResourceGroupName $rgname
