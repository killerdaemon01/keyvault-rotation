$raw = 'version2'

$secret = ConvertTo-SecureString $raw -AsPlainText -Force

$vaultname = (Get-AzKeyVault).VaultName
$secretname = (Get-AzKeyVaultSecret -VaultName $vaultname).Name

Set-AzKeyVaultSecret -VaultName $vaultname -Name $secretname -SecretValue $secret
