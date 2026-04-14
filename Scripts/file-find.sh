#!/bin/bash
fileName=$1

if [ -f "$fileName" ]
then
    read -p "Please enter file name: " fileName
    result=$(wc -l *$fileName)
    echo "There is $result lines in your file"

else 
    echo "There is no such file"
fi
    
search