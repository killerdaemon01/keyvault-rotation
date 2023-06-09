# Get the key vaults from the JSON file
$keyVaults = Get-Content -Raw -Path .\createkeyvaults.json | ConvertFrom-Json | Select-Object -ExpandProperty key_vaults

$rggroup = "my_resource_group"
$location = "eastus"
$serviceprincipal = "850f2186-cf3d-413f-990c-95e0de63e3a2"
$userprincipal = "AdminA@bladeztrail007gmail.onmicrosoft.com"

# Loop through each key vault
foreach ($keyVault in $keyVaults) {
    # Create the key vault
    New-AzKeyVault -VaultName $keyVault.name -ResourceGroupName $rggroup -Location $location
    Set-AzKeyVaultAccessPolicy -VaultName $keyVault.name -ServicePrincipalName $serviceprincipal -PermissionsToSecrets all
    Set-AzKeyVaultAccessPolicy -VaultName $keyVault.name -UserPrincipalName $userprincipal -PermissionsToSecrets all

    # Loop through each secret in the key vault
    foreach ($secret in $keyVault.secrets) {
        # Create the secret
        $secretValue = ConvertTo-SecureString $secret.value -AsPlainText -Force
        Set-AzKeyVaultSecret -VaultName $keyVault.name -Name $secret.name -SecretValue $secretValue
    }
}
