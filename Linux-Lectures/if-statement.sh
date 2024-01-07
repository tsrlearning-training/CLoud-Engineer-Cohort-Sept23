#!/bin/bash

########################################################
# Author: Louis Benagha
# Script: If statement
# Purpose: This script is to create if statements
#########################################################

read -p "Enter a value for m: " m
read -p "Enter a value for p: " p

# Mathematical Operators in Shell script
if [ $m -lt $p ]
then
    echo "yes $m is indeed less than the value $p"
else
    echo "you added a value greater than $m, please choose a lesser value"
fi


if [ $m -eq $p ]
then
    echo "yes $m is indeed equal to the value $p"
else
    echo "$m is not equal to the value $p, please choose a number that is equal"
fi

if [ $m -gt $p ]
then
    echo "yes $m is indeed greater than the value $p"
else
    echo "$m is not greater than to the value $p, please choose a higher value for $m"
fi

if [ $m -ge $p ]
then
    echo "yes $m is indeed greater than or equal to the value $p"
else
    echo "$m is not greater than or equal to the value $p, please choose a higher value for $m"
fi

if [ $m -le $p ]
then
    echo "yes $m is indeed less than or equal to the value $p"
else
    echo "$m is not less than or equal to the value $p, please choose a lesser value for $m"
fi


if [ $m -ne $p ]
then
    echo "yes $m is not equal to the value $p"
else
    echo "$m is equal to the value $p"
fi
