#!/bin/bash

# Variables
BUDGET=20
CURRENT_COST=0
AZURE_CLIENT_ID=$1
AZURE_CLIENT_SECRET=$2
AZURE_TENANT_ID=$3
AZURE_SUBSCRIPTION_ID=$4

# Get the current date in YYYY-MM-DD format
TODAY=$(date +%Y-%m-%d)
# Get the first day of the current month in YYYY-MM-DD format
START_OF_MONTH=$(date +%Y-%m-01)

# Log in to Azure using service principal
az login --service-principal -u "$AZURE_CLIENT_ID" -p "$AZURE_CLIENT_SECRET" --tenant "$AZURE_TENANT_ID"

# Construct the query JSON
query=$(cat <<EOF
{
    "type": "ActualCost",
    "timeframe": "Custom",
    "timePeriod": {
        "from": "$START_OF_MONTH",
        "to": "$TODAY"
    },
    "dataset": {
        "granularity": "None",
        "aggregation": {
            "totalCost": {
                "name": "PreTaxCost",
                "function": "Sum"
            }
        }
    }
}
EOF
)

# Run the query and get the current month's cost
CURRENT_COST=$(az costmanagement query --scope "/subscriptions/$AZURE_SUBSCRIPTION_ID" --type "ActualCost" --timeframe "Custom" --time-period-from "$START_OF_MONTH" --time-period-to "$TODAY" --dataset-aggregation "totalCost=sum(PreTaxCost)" --output tsv --query "properties.rows[0][0]")

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
