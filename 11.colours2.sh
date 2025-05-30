#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo -e " $R you are running this script with non root user. Please run with root user"
    exit 1  ##GIVE OTHER THAN 0 UPTO 127
else
    echo -e "$G you are running with ROOT user....GO AHEAD"
fi

dnf list installed mysql 

if [ $? -ne 0 ]
then
    echo "mysql installion is not done yet...going to install"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "My sql is installed sucessfully: SUCCESS"
    else
        echo "installation of Mysql failed"
        exit 1
    fi
else
    echo -e "$YMysql is installed already"
fi