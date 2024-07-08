#!/bin/bash
exec > >(sudo tee -a /var/log/docker_install.log) 2>&1
set -x

echo docker_gpg_url: ${docker_gpg_url}
echo docker_repo_url: ${docker_repo_url}
echo docker_repo_url: ${docker_compose_url}

docker_repo_url=${docker_repo_url}
docker_gpg_url=${docker_gpg_url}
docker_compose_url=${docker_compose_url}
user="adminuser"
docker_compose_bin_dir="/usr/local/bin/docker-compose"


if [[ -z "$docker_repo_url" || -z "$docker_gpg_url" || -z "$docker_compose_url" ]];then
    echo "variables missing"
    exit 1
fi

function apt_update() {
    sudo apt-get update
}

function install_dependecies() {
    apt_update
    sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL $docker_gpg_url | sudo apt-key add -
    sudo add-apt-repository -y "deb [arch=amd64] $docker_repo_url $(lsb_release -cs) stable"
}

function install_docker() {
    apt_update
    sudo apt-get -y install docker-ce && sudo groupadd docker || true
    sudo usermod -aG docker $user && newgrp docker 
    sudo systemctl enable docker && sudo systemctl start docker
}

# Install docker-compose
sudo curl -L "$docker_compose_url-$(uname -s)-$(uname -m)" -o $docker_compose_bin_dir
sudo chmod +x $docker_compose_bin_dir


