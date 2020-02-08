#!/bin/sh
printf '\e[8;30;110t'
clear
echo "======================================"
echo "Disable Run CiscoAnyConnect at Startup"
echo "======================================"
echo "The previous commands didn't worked on MacOSX Catalina."
echo "As the STEP1 - The folowing two commands"
echo "\033[1;31msudo defaults write /Library/LaunchAgents/com.cisco.anyconnect.gui.plist RunAtLoad -bool false\033[0m"
echo "and"
echo "\033[1;31msudo defaults write /Library/LaunchDaemons/com.cisco.anyconnect.vpnagentd.plist RunAtLoad -bool false\033[0m"
echo "messed up the files and didn't disabled the startup."
echo "As the STEP2 - The folowing two commands"
echo "\033[1;31msudo plutil -replace RunAtLoad -bool NO /Library/LaunchAgents/com.cisco.anyconnect.gui.plist\033[0m"
echo "and"
echo "\033[1;31msudo plutil -replace RunAtLoad -bool NO /Library/LaunchDaemons/com.cisco.anyconnect.vpnagentd.plist\033[0m"
echo "didn't messed up the files and set the RunAtLoad to false but didn't disabled the startup."
echo "\033[1;32mSTEP3 - As last resort\033[0m - We will delete those files..."
read -p "If you want to continue press ENTER, else press CTRL+Z to exit"
sleep 2s
if [ ! -d "/Users/$(whoami)/Desktop/CiscoBKP" ] 
then
    echo "Creating file(s) backup directory on \033[1;32m/Users/$(whoami)/Desktop/CiscoBKP\033[0m"
    mkdir /Users/$(whoami)/Desktop/CiscoBKP
    mkdir /Users/$(whoami)/Desktop/CiscoBKP/LaunchAgents
    mkdir /Users/$(whoami)/Desktop/CiscoBKP/LaunchDaemons
    sleep 2s
fi
if [[ -f "/Library/LaunchAgents/com.cisco.anyconnect.gui.plist" || -f "/Library/LaunchAgents/com.cisco.anyconnect.notification.plist" ]]
then
    sudo cp -R /Library/LaunchAgents/com.cisco.* /Users/$(whoami)/Desktop/CiscoBKP/LaunchAgents/
    sudo rm -rf /Library/LaunchAgents/com.cisco.*
else
    echo "\033[1;31m => \033[0mThe file \033[1;31m/Library/LaunchAgents/com.cisco.anyconnect.gui.plist\033[0m or ether the file \033[1;31m/Library/LaunchAgents/com.cisco.anyconnect.notification.plist\033[0m doesn't exist."
fi
if [ -f "/Library/LaunchDaemons/com.cisco.anyconnect.vpnagentd.plist" ]
then
    sudo cp -R /Library/LaunchDaemons/com.cisco.* /Users/$(whoami)/Desktop/CiscoBKP/LaunchDaemons/
    sudo rm -rf /Library/LaunchDaemons/com.cisco.*
else
    echo "\033[1;31m => \033[0mThe file \033[1;31m/Library/LaunchDaemons/com.cisco.anyconnect.vpnagentd.plist\033[0m doesn't exist."
fi
sleep 2s
if [[ -f "/Library/LaunchAgents/com.cisco.anyconnect.gui.plist" || -f "/Library/LaunchAgents/com.cisco.anyconnect.notification.plist" ]]
then
    echo "\033[1;31m => Something went wrong. We couldn't delete the file(s)!!!\033[0m"
else
    echo "\033[1;32mAll done!\033[0m"
    echo "\033[1;32mNote:\033[0m You may move the backup direcotry to a safe location if you want,"
    echo "but you will need to put it back on your desktop in case you want to revert this change."
fi