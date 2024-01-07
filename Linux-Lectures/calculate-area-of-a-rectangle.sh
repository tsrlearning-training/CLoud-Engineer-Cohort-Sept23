#!/bin/bash

##########################################################
# Author: Louis Benagha
# Script: Area of a Rectangle
# Purpose: This script is to calculate area of a rectangle
###########################################################

read -p "please input the value for length":     l
read -p "please input the value for breadth":    b

area_of_a_rectangle=$(( $l * $b ))
echo "The area of the rectangle is: $area_of_a_rectangle"
