#!/bin/bash

deploy --check >> check.log
backCode=$?
if [ $backCode -eq "0" ]
then
    echo "OK"
elif [ $backCode -eq "1" ]
then
    echo "Do not have permission"
elif [ $backCode -eq "2" ]
then
    echo "Do not find config"
fi