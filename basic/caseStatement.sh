#!/bin/bash

echo "Choose an option:"
echo "1. Show Date"
echo "2. Show Current Directory"
echo "3. Show Logged User"

read choice

case $choice in
    1)
        echo "Today's date:"
        date
        ;;
    
    2)
        echo "Current Directory:"
        pwd
        ;;
    
    3)
        echo "Logged User:"
        whoami
        ;;
    
    *)
        echo "Invalid Option"
        ;;
esac
