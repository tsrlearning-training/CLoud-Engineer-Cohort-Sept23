#!/bin/bash
set -x

db_user="root"
db_secrets="tsrlearning"
db_name="demo"
db_user_password="tsrlearning"

if [ -z "$db_user" ] || [ -z "$db_secrets" ] || [ -z "$db_name" ]; then
   echo "All expected variables have not been declared. Please pass the values for the variables."
   exit 1
fi

sudo apt-get update
sudo apt-get install -y expect
until sudo apt install -y mysql-server; do
  echo "Installation failed, retrying in 5 seconds..."
  sleep 5
done
echo "MySQL service successfully installed"

echo "Using Expect to run MySQL secure installation"
expect << EOF
spawn sudo mysql_secure_installation
expect "Enter password for user root: "
send "$db_secrets\r"
expect "Would you like to setup VALIDATE PASSWORD component?"
send "y\r"
expect "Please enter 0 = LOW, 1 = MEDIUM and 2 = STRONG: "
send "1\r"
expect "Change the password for root ?"
send "n\r"
expect "Remove anonymous users?"
send "y\r"
expect "Disallow root login remotely?"
send "y\r"
expect "Remove test database and access to it?"
send "y\r"
expect "Reload privilege tables now?"
send "y\r"
EOF

# Start Services
echo "Starting MySQL DB"
sudo systemctl start mysql.service 

# Create a database and user, handle existing cases
# sudo mysql -u root -p"$db_secrets" -e "CREATE DATABASE IF NOT EXISTS $db_name;"
# sudo mysql -u root -p"$db_secrets" -e "CREATE USER IF NOT EXISTS '$db_user'@'localhost' IDENTIFIED BY '$db_user_password';"
# sudo mysql -u root -p"$db_secrets" -e "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'localhost';"
# sudo mysql -u root -p"$db_secrets" -e "FLUSH PRIVILEGES;"

# echo "MySQL setup completed successfully."


# sudo mysql -u root -p"$db_secrets" -e  "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'reactapp';"
# FLUSH PRIVILEGES;
