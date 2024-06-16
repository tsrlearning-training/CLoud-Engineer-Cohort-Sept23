#!/bin/bash

set -x

wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vault -y

mkdir -p vault/data

# Create config file
tee config.hcl <<EOF
ui = true
disable_mlock = true
api_addr="http://localhost:8200"
cluster_addr="https://localhost:8201"

storage "raft" {
  path    = "./vault/data"
  node_id = "node1"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = "true"
}
EOF

sudo tee /etc/systemd/system/vault.service <<EOF

[Unit]
Description="HashiCorp Vault - A tool for managing secrets"
Documentation=https://developer.hashicorp.com/vault/docs
Requires=network-online.target
After=network-online.target

[Service]
User=tsrlearning
Group=tsrlearning
ExecStart=/usr/bin/vault server -config=/home/tsrlearning/config.hcl
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=on-failure
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
EOF

sudo chown tsrlearning:tsrlearning /home/tsrlearning/config.hcl
sudo chown tsrlearning:tsrlearning /etc/systemd/system/vault.service
chmod 644 /home/tsrlearning/config.hcl
chmod 644 /etc/systemd/system/vault.service

sudo systemctl daemon-reload
sudo systemctl enable vault.service
sudo systemctl start vault.service

# Start Vault server
vault server -config=config.hcl &