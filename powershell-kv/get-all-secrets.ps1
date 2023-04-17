# Get the key vaults from the JSON file
$keyVaults = Get-Content -Raw -Path .\keyvaults.json | ConvertFrom-Json | Select-Object -ExpandProperty key_vaults

# Loop through each key vault
foreach ($keyVault in $keyVaults) {
    # Print the key vault name
    # Write-Output "keyvault name: $($keyVault.name)"

    # Loop through each secret in the key vault
    foreach ($secret in $keyVault.secrets) {
        # Print the secret name
        Write-host $keyvault.name
        Write-host $secret.name
        Get-AzKeyVaultSecret -VaultName $keyVault.name -Name $secret.name -AsPlainText
        Write-host \n
    }
}
