#!/bin/bash
exec > >(sudo tee -a docker_install.log) 2>&1

function apt_update() {
    sudo apt-get update
}
apt_update

function install_dependecies() {
    apt_update
    sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
}
install_dependecies

function install_docker() {
    sudo apt-get -y install docker-ce
    sudo groupadd docker || true
    sudo usermod -aG docker tsrlearning
    newgrp docker 
    sudo systemctl enable docker
    sudo systemctl start docker
}
install_docker