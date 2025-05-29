#!/bin/bash

myfamily=("Gangadhar" "Laxmi" "Saiteja" "Anusha")

Main_member=${myfamily[0]}
family=${myfamily[@]}
echo "$family"
meandwife=${myfamily[0,3]}
echo "$Main_member"
echo "$meandwife"