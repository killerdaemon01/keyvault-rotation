# Get the key vaults from the JSON file
$keyVaults = Get-Content -Raw -Path .\keyvaults.json | ConvertFrom-Json | Select-Object -ExpandProperty key_vaults
$location = "eastus"
# Loop through each key vault
foreach ($keyVault in $keyVaults) {
    # Purge the key vault and its contents
    # $deletedVault = Get-AzKeyVault -InRemovedState -Location $location -VaultName $keyVault.name -ErrorAction SilentlyContinue
    # if ($deletedVault) {
    Remove-AzKeyVault -VaultName $keyVault.name -Location $location -InRemovedState -Force
    # }
}
