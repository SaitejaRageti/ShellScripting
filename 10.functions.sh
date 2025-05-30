#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo " you are running this script with non root user. Please run with root user"
    exit 1  ##GIVE OTHER THAN 0 UPTO 127
else
    echo "you are running with ROOT user....GO AHEAD"
fi

validate(){
    if [ $1 -eq 0 ]
    then
        echo "installing $2 is success"
    else
        echo "installing $2 is failure"
        exit
    fi

}

dnf list installed mysql

if [ $? -eq 0 ]
then
    echo " mysql is installed already"
    
else
    echo "mysql is not installed yet going to install"
    dnf install mysql -y
    validate $? "mysql"
fi 

dnf list installed python3

if [ $? -eq 0 ]
then
    echo "python is installed already"
else
    echo "python is not installed yet going to install"
    dnf install python3 -y
    validate $? "python"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "nginx is already installed...Nothing to do"
fi

