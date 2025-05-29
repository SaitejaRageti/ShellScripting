#!/bin/bash

number1=25
number2=35
timestamp=$(date)
echo "starting my script on $timestamp"
Sum = $(number1+number2)
echo "$sum"
if [$sum -ge 60];then
do 
    echo "$sum id greater than 60"
else
    echo "its a small number"
fi 

