#!/bin/bash
exec > >(sudo tee -a docker_install.log) 2>&1

# Update apt package index
sudo apt-get -y update

# Install packages to allow apt to use a repository over HTTPS
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker apt repository
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update apt package index after adding Docker repository
sudo apt-get -y update

# Install Docker CE
sudo apt-get -y install docker-ce

# Create docker group if not present
sudo groupadd docker || true

# Add user to docker group
sudo usermod -aG docker tsrlearning

# Enable and start Docker service
sudo systemctl enable docker
sudo systemctl start docker
