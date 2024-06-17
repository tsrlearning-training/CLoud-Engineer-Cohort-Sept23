#!/bin/bash

# Variables
BUDGET=20
CURRENT_COST=0
AZURE_CLIENT_ID=$1
AZURE_CLIENT_SECRET=$2
AZURE_TENANT_ID=$3

# Get the current date in YYYY-MM-DD format
TODAY=$(date +%Y-%m-%d)
# Get the first day of the current month in YYYY-MM-DD format
START_OF_MONTH=$(date +%Y-%m-01)

# Log in to Azure using service principal
az login --service-principal -u "$AZURE_CLIENT_ID" -p "$AZURE_CLIENT_SECRET" --tenant "$AZURE_TENANT_ID"

# Get the current month's cost
CURRENT_COST=$(az consumption cost management query -a -t ActualCost --time-period "start=$START_OF_MONTH,end=$TODAY" --output tsv --query 'properties.rows[].cost' | awk '{s+=$1} END {print s}')

# Check if the current cost exceeds the budget
if [[ -z "$CURRENT_COST" ]]; then
    echo "Error: Failed to retrieve current cost."
    exit 1
fi

if (( $(echo "$CURRENT_COST > $BUDGET" | bc -l) )); then
    echo "Alert: Azure cost has exceeded the budget of $BUDGET. Current cost: $CURRENT_COST"
    # Send a notification to Microsoft Teams (You need to have TEAMS_WEBHOOK_URL configured in your GitHub Secrets)
    PAYLOAD=$( jq -n --arg msg "Alert: Azure cost has exceeded the budget of $BUDGET. Current cost: $CURRENT_COST" '{ text: $msg }' )
    curl -H "Content-Type: application/json" -d "$PAYLOAD" "$TEAMS_WEBHOOK_URL"
else
    echo "Azure cost is within the budget. Current cost: $CURRENT_COST"
fi
