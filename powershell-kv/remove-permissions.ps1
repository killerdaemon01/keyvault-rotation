# Get the key vaults from the JSON file
$keyVaults = Get-Content -Raw -Path .\keyvaults.json | ConvertFrom-Json | Select-Object -ExpandProperty key_vaults

$userprincipal = "AdminA@bladeztrail007gmail.onmicrosoft.com"

# Loop through each key vault
foreach ($keyVault in $keyVaults) {
    # Delete the key vault and its contents
    Remove-AzKeyVaultAccessPolicy -VaultName $keyVault -UserPrincipalName $userprincipal -PassThru

}
