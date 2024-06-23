#!/bin/bash
exec > >(sudo tee -a /var/log/ghrunner_install.log) 2>&1

# Declare variables
RUNNER_URL="${RUNNER_URL}"
RUNNER_SHA="${RUNNER_SHA}"
RUNNER_TAR="${RUNNER_TAR}"

# Debug: Print variables
echo "RUNNER_URL: ${RUNNER_URL}"
echo "RUNNER_SHA: ${RUNNER_SHA}"
echo "RUNNER_TAR: ${RUNNER_TAR}"

# Create a folder
mkdir -p actions-runner
cd actions-runner

# Debug: Print current directory
echo "Current directory: $(pwd)"

# Download and verify the runner
curl -o actions-runner-linux-x64-2.317.0.tar.gz -L "${RUNNER_URL}"
echo "${RUNNER_SHA}  actions-runner-linux-x64-2.317.0.tar.gz" | shasum -a 256 -c
tar xzf "${RUNNER_TAR}"
