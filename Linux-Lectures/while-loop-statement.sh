#!/bin/bash

########################################################
# Author: Louis Benagha
# Script: While Loop Script
# Purpose: This script is to create while loop statements
#########################################################

read -p "Please enter a value here: " a

while [ $a -lt 1000 ]
do
  echo $a
  a=`expr $a + 1`
done

while [ $a -gt 10 ]
do
 echo $a
 a=`expr $a + 1`
done

while :
do
 echo "Hello everyone, we need to enter crtl+c to stop"
done

count=1
while  [ $count -le 5 ]
do
   echo "Number: $count"
   count=$((count+1))
done


while read -r line
do
  echo "Line: $line"
done < file.txt

read -p "Please enter file name: " file_name

while [ ! -f "$file_name" ]
do
 echo "Waiting until $file_name is created or becomes available.........."
 sleep 5
done

echo "$file_name now exits"
