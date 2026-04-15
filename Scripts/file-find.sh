#!/bin/bash

if [ -f "$1" ]
then
    result=$(wc -l $1)
    echo "There is $result lines in your file"

else 
    echo "There is no such file"
fi