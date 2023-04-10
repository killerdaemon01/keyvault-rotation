from os import environ as env
from azure.identity import ClientSecretCredential
from azure.keyvault.secrets import SecretClient

AZURE_CLIENT_ID = "de36cf35-ab3e-4f06-9bae-4ba5aacf3de5"
AZURE_TENANT_ID = "e91da06d-d553-4514-abb7-37915b003fc8"
AZURE_CLIENT_SECRET = "qC18Q~PqcAYjNY2jkade6TgPseohblNacVKs8cx7"

keyvault = "keyvault129017"
kvurl = f"https://{keyvault}.vault.azure.net/"

credential = ClientSecretCredential(tenant_id=AZURE_TENANT_ID, client_id=AZURE_CLIENT_ID, client_secret=AZURE_CLIENT_SECRET)
sc = SecretClient(vault_url=kvurl,credential=credential)
username = sc.get_secret("secret1").value
# password = sc.get_secret("pass").value

print(username)
# print(password)
