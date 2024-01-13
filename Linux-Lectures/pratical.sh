#!/bin/bash

########################################################
# Author: Louis Benagha
# Script: Pratcical scripts
# Purpose: This script is to show pratical scenarios
#########################################################

# if cat $1
# then
#  echo "File $1 exists\nfound and successful\nending program now"
# fi


# if rm $1
# then
#  echo "File $1 exists\nremoving file!!!!"
# fi

# user=$(whoami)

# if [ "$user" == "server-001" ]
# then 
#   echo "Your logged user $user is correct"

# elif [ "$user" == "root" ]
# then 
#   echo "Your logged user $user is correct"
 
# elif [ "$user" == "demo" ]
# then 
#   echo "Your logged user $user is correct"
 
# else
#  echo "You are logged in with the wrong user"
# fi


# script -1: Checks if a file exists or not

FILE="demo.sh"

if [ -f $FILE ];then
  echo "$FILE already exists"
#  exit 0

else
  echo "$FILE doesn't exist"
  touch demo.sh && echo "#!/bin/bash\n\n# Simple script\n*******************\necho this is your: $PWD\n\na=1\nb=2\necho your sum is: \$((a+b))" > demo.sh
  chmod 744 demo.sh && sh demo.sh
fi


# script -2: For-Loop through names

Names="Ebuka Olusola Micheal Bode KimboJnr Louis"

for list_names in $Names; do
   echo "Hello $list_names Good Evening and welcome to class"
done


# script -3: Rename files with "tsrlearning-" prefix

# New_Name="tsrlearning"

# for list_name in *.sh; do
#  echo "Renaming $list_name to $New_Name-$list_name"
#  mv "$list_name" "$New_Name-$list_name"
# done

# script -3 Name comparision
read -p "Enter first name: "  Name_1
read -p "Enter second name: " Name_2
read -p "Enter third name: "  Name_3
read -p "Enter fourth name: " Name_4


if [ "$Name_1" == "Bode" ];then
   echo "Yes your first real name is: $Name_1"

elif [ "$Name_2" == "Ebuka" ];then
  echo "Yes your second real name is: $Name_2"

elif [ "$Name_3" == "Micheal" ];then
  echo "Yes your third real name is: $Name_3"

elif [ "$Name_4" == "Olusola" ];then
  echo "Yes your fourth real name is: $Name_4"

else
   echo "Your names was neither $Name_1 or $Name_2 or $Name_3 or $Name_4"
fi


# script -4: To check a system service if active or not

until systemctl is-active --quiet vault.service; do
     echo "Vault service is down, please start vault.service"
     sleep 5
done

echo "Vault service is now active"


# script -5: check name input
read -p "enter your age: " age

if [ $age -lt 21 ];then
   echo "You are a teenager and can not drink in the USA"

elif [ $age -ge 21 ] || [ $age -eq 21 ] && [ $age -ne 21 ];then
   echo "Hurray! Your are eligble to drink or buy a drink in the USA"
else
   echo "Please submit you ID as proof"
fi


# script 6: show date format
date_2=$(date '+%Y-%m-%d')
echo "Today's date is: $(date)"


date_2=$(date '+%Y-%m-%d %H:%M:%S')
echo "Date in this format yyyy-mm-dd HH:MM:SS format: $date_2)"


# script 7: show how to check if a variable exits

DB_HOST=$DB_HOST
DB_PASSWORD=$DB_PASSWORD

if [ -z "$DB_HOST" ];then
   echo "Error: No database host was passed."
fi

DB_PASSWORD="tsrlearning"

if [ -z "$DB_PASSWORD" ];then
   echo "Error: No database password was passed."
else
  DB_PASS=$(echo -n "$DB_PASSWORD" | base64)
  echo "encrypted database password: $DB_PASS"
fi


# Script to check my IP
current_ip=$(curl -s http://ifconfig.me/ip)
known_ip="172.33.56.908"
ip_file="/mnt/tsrlearning-lab/shell-scripts/ipaddress.txt"

if  [ -f $ip_file ];then
   echo "file already exists"
else
   touch $ip_file && echo "file now exists!"
fi 


if [ "$current_ip" != "$known_ip" ];then
   echo "$current_ip" > "$ip_file"
else
   echo "Your IP address for your home is still the same: $current_ip"
fi
