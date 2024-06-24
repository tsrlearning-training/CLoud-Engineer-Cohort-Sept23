#!/bin/bash
exec > >(sudo tee -a /var/log/ghrunner_install.log) 2>&1


# install
sudo apt -y update
sudo apt  install jq -y
sudo apt-get -y install expect

# Declare variables
RUNNER_URL="${RUNNER_URL}"
RUNNER_SHA="${RUNNER_SHA}"
RUNNER_TAR="${RUNNER_TAR}"
TOKEN="${TOKEN}"
GITHUB_ORG="tsrlearning-training"
HOME="/home/tsrlearning"
USER="tsrlearning"

# Debug: Print variables
echo "RUNNER_URL: ${RUNNER_URL}"
echo "RUNNER_SHA: ${RUNNER_SHA}"
echo "RUNNER_TAR: ${RUNNER_TAR}"
echo "TOKEN:      ${TOKEN}"


# Create a folder and navigate into it
mkdir -p "$HOME/actions-runner"
cd "$HOME/actions-runner"
echo $PWD
# sudo chown -R $USER:$USER "$HOME/actions-runner"

curl -o actions-runner-linux-x64-2.317.0.tar.gz -L "${RUNNER_URL}"
echo "${RUNNER_SHA}  actions-runner-linux-x64-2.317.0.tar.gz" | shasum -a 256 -c
tar xzf "${RUNNER_TAR}"

curl -L  -X POST -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer ${TOKEN}" -H "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/orgs/$GITHUB_ORG/actions/runners/registration-token > response.json 

# Ensure response.json is owned by the current user
sudo chown $USER:$USER response.json

RUNNER_TOKEN=$(jq -r '.token' response.json)
echo "RUNNER_TOKEN: $RUNNER_TOKEN"

# Run the configuration script with automated inputs
echo "Running GitHub Actions runner configuration"

./config.sh --url https://github.com/$GITHUB_ORG --token $RUNNER_TOKEN <<EOF
TSRLearning Default Runner Group
ghrunner-vm-01
self-hosted,Linux,X64,ghrunner-vm-01
_work
EOF

# Ensure correct ownership before installing the service
sudo chown -R $USER:$USER "$HOME/actions-runner"

./run.sh &

# Install and start the service
sudo ./svc.sh install
sudo ./svc.sh start
