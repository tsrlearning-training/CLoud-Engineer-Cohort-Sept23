#!/bin/bash

# Mount volume
sudo su -
pvcreate /dev/sdc
vgcreate data /dev/sdc
lvcreate -n phpapp -L 5G data
mkfs.ext4 /dev/data/phpapp
sudo mount /dev/data/phpapp /mnt/var/www/html/
sudo echo "/dev/data/phpapp /mnt/var/www/html/ ext4 defaults 0 0" >> /etc/fstab

# Test mount
sudo mount -a


# Install
sudo apt update
sudo apt install -y apache2
sudo apt install -y mysql-server
sudo mysql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'tsrlearning';
sudo mysql_secure_installation
sudo apt install php libapache2-mod-php php-mysql

# Change permissions
sudo chown -R www-data:www-data /var/www/*
sudo find /var/www -type f -exec chmod 644 {} \;a
sudo find /var/www -type d -exec chmod 755 {} \;

# Set Database Permissions
mysql -u root -p
GRANT ALL PRIVILEGES ON data.* TO 'root'@'localhost';
FLUSH PRIVILEGES;

# Restart Services
sudo systemctl restart apache2
systemctl status mysql
sudo systemctl restart mysql.service 
sudo systemctl status mysql.service 
