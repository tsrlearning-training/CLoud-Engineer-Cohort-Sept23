#!/bin/bash
exec > >(sudo tee -a /var/log/ghrunner_install.log) 2>&1

# Declare variables
RUNNER_URL="${RUNNER_URL}"
RUNNER_SHA="${RUNNER_SHA}"
RUNNER_TAR="${RUNNER_TAR}"
TOKEN="${TOKEN}"

# Debug: Print variables
echo "RUNNER_URL: ${RUNNER_URL}"
echo "RUNNER_SHA: ${RUNNER_SHA}"
echo "RUNNER_TAR: ${RUNNER_TAR}"
echo "TOKEN: ${TOKEN}"

# Create a folder
mkdir -p actions-runner
cd actions-runner

# Debug: Print current directory
echo "Current directory: $(pwd)"

# Download and verify the runner
curl -o actions-runner-linux-x64-2.317.0.tar.gz -L "${RUNNER_URL}"
echo "${RUNNER_SHA}  actions-runner-linux-x64-2.317.0.tar.gz" | shasum -a 256 -c
tar xzf "${RUNNER_TAR}"

curl -L  -X POST -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer ${TOKEN}" -H "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/orgs/ORG/actions/runners/registration-token > reponse.json 

RUNNER_TOKEN=$(jq -r '.token' response.json)
echo "RUNNER_TOKEN: $RUNNER_TOKEN"

./config.sh --url https://github.com/tsrlearning-training --token $RUNNER_TOKEN