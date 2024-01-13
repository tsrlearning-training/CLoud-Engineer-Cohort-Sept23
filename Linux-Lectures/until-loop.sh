#!/bin/bash

########################################################
# Author: Louis Benagha
# Script: Until Loop Script
# Purpose: This script is to create until loop statements
#########################################################

read -p "Enter your value here: " b

until [ "$b" -ge 10 ]
do
  echo $b && b=$((b+1))
done

input="exit"

until [ "$input" == "exit" ]
do 
 echo "Type 'exit' to quit this program"
done

echo "You finally enter a value for the variable input, exiting the loop now!!!..."


number=7
read -p "Enter your guess number here: " guess

until [ "$guess" -eq "$number" ]
do
  echo "Please guess a number from 1 and 10"
  if [ "$guess" -lt "$number" ]
  then
    echo "Oh no! number is low"
  elif [ "$guess" -gt "$number" ]
  then
    echo "Oh wow! that is too much of a guess!"
  fi
done

echo "Congratulations! You guess the correct number. Thanks for Participation!"
