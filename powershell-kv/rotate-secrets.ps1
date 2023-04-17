function Generate-RandomApiKey {
    # Generate a random byte array
    $randomBytes = New-Object byte[](48)
    [Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($randomBytes)

    # Convert the byte array to a Base64-encoded string
    $apiKey = [System.Convert]::ToBase64String($randomBytes)

    # Return the API key
    return $apiKey
}


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
        $apiKey = ConvertTo-SecureString $(Generate-RandomApiKey) -AsPlainText -Force
        Set-AzKeyVaultSecret -VaultName $keyvault.name -Name $secret.name -SecretValue $apiKey
    }
}