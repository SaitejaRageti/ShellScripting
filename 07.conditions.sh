#!/bin/bash

number1=$1
number2=$2

timestamp=$(date '+%Y-%m-%d %H:%M:%S')
echo "starting my script at : $timestamp"
Sum=$(($1+$2))
echo "$Sum"
if [ $Sum -gt 60 ]
then
    echo "$Sum id greater than 60"
elif [ $Sum -eq 60 ]
then
    echo "$Sum is equal to 60"
else
    echo "its a small number"
fi 
