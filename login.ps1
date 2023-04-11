$password = ConvertTo-SecureString "password.61" -AsPlainText -Force

$cred = New-Object System.Management.Automation.PSCredential("email",$password)

Connect-AzAccount -Credential $cred
