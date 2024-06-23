#!/bin/bash

# Fetch the GitHub Actions IP ranges
GITHUB_ACTIONS_IP_RANGES=$(curl -s https://api.github.com/meta | jq -r '.actions[]')

# Update firewall rules (this example assumes you are using Azure Network Security Groups)
RESOURCE_GROUP="rg-tsrlearning-demo"
NSG_NAME="nsg-ce-tsrlearning-dev-01"

# # Remove existing rules for GitHub Actions (optional)
# az network nsg rule delete --resource-group $RESOURCE_GROUP --nsg-name $NSG_NAME --name AllowGitHubActions

# Add a rule for each GitHub Actions IP range
PRIORITY=113
for IP in $GITHUB_ACTIONS_IP_RANGES; do
  az network nsg rule create --resource-group $RESOURCE_GROUP --nsg-name $NSG_NAME \
    --name AllowGitHubActions$PRIORITY --priority $PRIORITY --source-address-prefixes $IP \
    --destination-address-prefixes '*' --destination-port-ranges 8200 --direction Inbound \
    --access Allow --protocol Tcp
  PRIORITY=$((PRIORITY + 1))
done
