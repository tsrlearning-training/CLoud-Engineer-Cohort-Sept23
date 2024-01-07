#!/bin/bash

########################################################
# Author: Louis Benagha
# Script: For Loop Script
# Purpose: This script is to create for loop statements
#########################################################

read -p  "Enter your value here please: " paragraph

for word in $paragraph
do
  echo $word
done

read -p  "Enter your value here please: "  numbers

for i in $numbers
do
  echo $i
done

read -p "Please enter the filename here: " filename
for file in $filename
do
 echo $filename
done
