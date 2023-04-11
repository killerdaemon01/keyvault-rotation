$vaultname = (Get-AzKeyVault).VaultName

$secretname = (Get-AzKeyVaultSecret -VaultName $vaultname).name

Get-AzKeyVaultSecret -VaultName $vaultname -Name $secretname -AsPlainText
