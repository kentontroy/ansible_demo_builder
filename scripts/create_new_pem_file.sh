#!/bin/bash

# Prompt for key name
read -p "Enter the name for your SSH key: " KEY_NAME

# Set variables
KEY_PATH="../vault/$KEY_NAME"

# Generate the SSH key
ssh-keygen -t rsa -b 2048 -f "$KEY_PATH" -N ""

# Save the private key to PEM format
cp ${KEY_PATH} ${KEY_PATH}.pem

# Set correct permissions for the private key
chmod 400 "${KEY_PATH}.pem"

# Output the public key
cat "${KEY_PATH}.pub"

echo "SSH key pair generated:"
echo "Private key (PEM format): ${KEY_PATH}.pem"
echo "Public key: ${KEY_PATH}.pub"

# Output the key name for easy reference
echo "Key name: $KEY_NAME"
