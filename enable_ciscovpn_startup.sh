#!/bin/sh
printf '\e[8;30;110t'
clear
echo "====================================="
echo "Enable Run CiscoAnyConnect at Startup"
echo "====================================="
echo "This will enable back the startup of CiscoAnyConnect at MacOSX startup."
read -p "If you want to continue press ENTER, else press CTRL+Z to exit"
if [ -d "/Users/$(whoami)/Desktop/CiscoBKP" ] 
then
    echo "Restoring files..."
    sudo cp -R /Users/$(whoami)/Desktop/CiscoBKP/LaunchAgents/com.cisco.* /Library/LaunchAgents/
    sudo cp -R /Users/$(whoami)/Desktop/CiscoBKP/LaunchDaemons/com.cisco.* /Library/LaunchDaemons/
    sleep 2s
    echo "Removing backup directory..."
    sudo rm -rf /Users/$(whoami)/Desktop/CiscoBKP
    sleep 2s
    echo "\033[1;32mAll done!\033[0m"
else
    echo "\033[1;31m => \033[0mThe directory \033[1;31m/Users/$(whoami)/Desktop/CiscoBKP\033[0m doesn't exist."
    echo "\033[1;32mNote:\033[0m If You moved the CiscoBKP from your desktop to a safe location,"
    echo "please put it back in case you want to make this change."
fi
