#!/bin/bash

##########################################################
# Author: Louis Benagha
# Script: if-elif-else-statement
# Purpose: This script is to create if-elif-else statements
###########################################################

read -p "Enter the value of a : " a

read -p "Enter the value of b : " b

if [ "$a" -eq "$b" ]; then
    echo "A is equal to B"

elif [ "$a" -gt "$b" ]; then
    echo "A is greater than B"

elif [ "$a" -lt "$b" ]; then
    echo "A is less than B"
else
    "$a is neither equal to $b, or $a greater than $b or $a less than $b"
fi
