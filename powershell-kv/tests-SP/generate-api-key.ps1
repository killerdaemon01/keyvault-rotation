function APIKeyGen {
    # Generate a random byte array
    $randomBytes = New-Object byte[](48)
    [Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($randomBytes)

    # Convert the byte array to a Base64-encoded string
    $apiKey = [System.Convert]::ToBase64String($randomBytes)

    # Return the API key
    return $apiKey
}

# Call the function to generate a random API key
$apiKey = APIKeyGen

# Print the API key
Write-Output "API keys: $apiKey"
