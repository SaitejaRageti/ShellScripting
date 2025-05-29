#!/bin/bash

number1=25
number2=55
timestamp=$(date)
echo "starting my script on $timestamp"
Sum=$(($number1+$number2))
echo "$Sum"
if [ $Sum -gt 60 ]
then
    echo "$Sum id greater than 60"
else
    echo "its a small number"
fi 

