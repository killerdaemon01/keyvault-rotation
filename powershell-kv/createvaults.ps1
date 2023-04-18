# Get the key vaults from the JSON file
$keyVaults = Get-Content -Raw -Path .\createkeyvaults.json | ConvertFrom-Json | Select-Object -ExpandProperty key_vaults

$rggroup = "my_resource_group"
$location = "eastus"

# Loop through each key vault
foreach ($keyVault in $keyVaults) {
    # Create the key vault
    New-AzKeyVault -VaultName $keyVault.name -ResourceGroupName $rggroup -Location $location
    Set-AzKeyVaultAccessPolicy -VaultName $keyVault.name -ServicePrincipalName $serviceprincipal -PermissionsToSecrets all

    # Loop through each secret in the key vault
    foreach ($secret in $keyVault.secrets) {
        # Create the secret
        $secretValue = ConvertTo-SecureString $secret.value -AsPlainText -Force
        Set-AzKeyVaultSecret -VaultName $keyVault.name -Name $secret.name -SecretValue $secretValue
    }
}
