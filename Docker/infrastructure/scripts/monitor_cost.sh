#!/bin/bash

# Variables
BUDGET=20
CURRENT_COST=0
AZURE_CLIENT_ID=$1
AZURE_CLIENT_SECRET=$2
AZURE_TENANT_ID=$3


# Log in to Azure using service principal
az login --service-principal -u "$AZURE_CLIENT_ID" -p "$AZURE_CLIENT_SECRET" --tenant "$AZURE_TENANT_ID"

# Get the current month's cost
CURRENT_COST=$(az consumption usage list --query '[].{cost:pretaxCost}' --output tsv | awk '{s+=$1} END {print s}')

# Check if the current cost exceeds the budget
if (( $(echo "$CURRENT_COST > $BUDGET" | bc -l) )); then
    echo "Alert: Azure cost has exceeded the budget of $BUDGET. Current cost: $CURRENT_COST"
    # Send a notification to Microsoft Teams (You need to have TEAMS_WEBHOOK_URL configured in your GitHub Secrets)
    PAYLOAD=$( jq -n --arg msg "Alert: Azure cost has exceeded the budget of $BUDGET. Current cost: $CURRENT_COST" '{ text: $msg }' )
    # curl -H "Content-Type: application/json" -d "$PAYLOAD" "$TEAMS_WEBHOOK_URL"
else
    echo "Azure cost is within the budget. Current cost: $CURRENT_COST"
fi