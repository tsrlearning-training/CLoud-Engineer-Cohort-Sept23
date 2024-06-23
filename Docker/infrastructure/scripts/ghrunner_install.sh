#!/bin/bash
exec > >(sudo tee -a /var/log/ghrunner_install.log) 2>&1


# install
sudo apt  install jq -y
sudo apt-get install expect -y

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
    https://api.github.com/orgs/ORG/actions/runners/registration-token > response.json 

RUNNER_TOKEN=$(jq -r '.token' response.json)
echo "RUNNER_TOKEN: $RUNNER_TOKEN"

sudo chown -R tsrlearning:tsrlearning /actions-runner
# ./config.sh --url https://github.com/tsrlearning-training --token $RUNNER_TOKEN

# Change to the actions-runner directory
cd /home/tsrlearning/actions-runner

# Start the configuration script
spawn ./config.sh --url $github_url --token $RUNNER_TOKEN

expect "Enter the name of the runner group to add this runner to:" {
    send "\r"
}

expect "Enter the name of runner:" {
    send "\r"
}

expect "Enter any additional labels (ex. label-1,label-2):" {
    send "ghrunner-vm01\r"
}

expect "Enter name of work folder:" {
    send "\r"
}

# Wait for the process to complete
expect eof

sudo ./svc.sh install
sudo ./svc.sh start