#!/bin/bash

########################################################
# Author: Louis Benagha
# Script: Mathematical Expressions
# Purpose: This script is to create math expressions
#########################################################

read -p " enter your value for a":  a
read -p " enter your value for b":  b

# Arithmetic Operators
expr "$a" + "$b"
expr "$a" - "$b"
expr "$a" / "$b"
expr "$a" \* "$b"
expr "$a" % "$b"

# Regular Mathematical Operators
echo $((a > b))
echo $((a < b))
echo $((a != b))
echo $((a == b))
echo $((a <= b))
echo $((a >= b))
