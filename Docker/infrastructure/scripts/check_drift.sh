#!/bin/bash

# Variables
AZURE_CLIENT_ID=$1
AZURE_CLIENT_SECRET=$2
AZURE_TENANT_ID=$3
SLACK_WEBHOOK_URL=$4

# Log in to Azure using service principal
az login --service-principal -u "$AZURE_CLIENT_ID" -p "$AZURE_CLIENT_SECRET" --tenant "$AZURE_TENANT_ID"

# Initialize Terraform
terraform init

# Run Terraform Plan
terraform plan -detailed-exitcode > plan_output.txt
PLAN_EXIT_CODE=$?

if [ $PLAN_EXIT_CODE -eq 2 ]; then
    echo "Drift detected in Terraform configuration"
    DRIFT_MESSAGE=$(cat plan_output.txt)
    # Send a notification to Slack
    PAYLOAD=$( jq -n --arg text "Drift detected in Terraform configuration:\n$DRIFT_MESSAGE" '{ text: $text }' )
    curl -X POST -H "Content-Type: application/json" -d "$PAYLOAD" "$SLACK_WEBHOOK_URL"
elif [ $PLAN_EXIT_CODE -eq 0 ]; then
    echo "No drift detected"
else
    echo "Error running terraform plan"
    exit 1
fi
