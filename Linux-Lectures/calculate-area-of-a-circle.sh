#!/bin/bash

##########################################################
# Author: Louis Benagha
# Script: Area of a Circle
# Purpose: This script is to calculate area of a circle
###########################################################

Pi=3.142
read -p "Enter the value for the radius of the circle: " r

# Calculate the area ( Area = Pi * raduis^2)
area=$(echo "$Pi*($r^2)"|bc )
echo "Area of a circle is: $area"

# Calculate the circumference of a circle ( C = 2 * Pi * r)
area=$(echo "(2*$Pi*$r)"|bc )
echo "Area of a circumference is: $area"
