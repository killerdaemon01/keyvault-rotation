# Get the key vaults from the JSON file
$keyVaults = Get-Content -Raw -Path .\keyvaults.json | ConvertFrom-Json | Select-Object -ExpandProperty key_vaults

# Loop through each key vault
foreach ($keyVault in $keyVaults) {
    # Delete the key vault and its contents
    Remove-AzKeyVault -VaultName $keyVault.name -ResourceGroupName $(Get-AzKeyVault -VaultName $keyVault.name).ResourceGroupName -Force
}
