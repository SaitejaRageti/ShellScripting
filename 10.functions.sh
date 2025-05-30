#!/bin/bash

USERID=$(id -u)
script_start_time=$(date)
echo "$script_start_time"
script_name=$(echo $0 | cut -d "." -f1)
LOGS_FOLDER="/var/logs/shell_scripting_logs"
mkdir -p $LOGS_FOLDER
Logfile=$LOGS_FOLDER/$script_name.log"

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

dnf list installed mysql &>>$LOG_FILE

if [ $? -eq 0 ]
then
    echo "mysql is installed already"
    
else
    echo "mysql is not installed yet going to install"
    dnf install mysql -y
    validate $? "mysql"
fi 

dnf list installed python3 & >>$LOG_FILE

if [ $? -ne 0 ]
then
    echo "python is not installed yet going to install" | tee -a $LOG_FILE
    dnf install python3 -y
    validate $? "python"
else
    echo "python is already installed nothing to do" | tee -a $LOG_FILE
fi

dnf list installed nginx & >>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it"
    dnf install nginx -y
    validate $? "nginx"
else
    echo "nginx is already installed...Nothing to do" | tee -a $LOG_FILE
fi

