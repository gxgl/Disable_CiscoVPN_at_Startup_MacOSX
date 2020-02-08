# Disable the Cisco Anyconnect VPN Client for MacOSX Catalina

The previous commands didn't worked on MacOSX Catalina.

## As the STEP1 - I have tryied the following two commands
**sudo defaults write /Library/LaunchAgents/com.cisco.anyconnect.gui.plist RunAtLoad -bool false** 
and 
**sudo defaults write /Library/LaunchDaemons/com.cisco.anyconnect.vpnagentd.plist RunAtLoad -bool false**
as described here https://community.cisco.com/t5/vpn-and-anyconnect/anyconnect-secure-mobility-disable-the-automatic-launch-on-login/m-p/3790793/highlight/true#M148875 but the commands messed up the files content and didn't disabled the startup.

## As the STEP2 - I have tryied the folowing two commands"
**sudo plutil -replace RunAtLoad -bool NO /Library/LaunchAgents/com.cisco.anyconnect.gui.plist**
and
**sudo plutil -replace RunAtLoad -bool NO /Library/LaunchDaemons/com.cisco.anyconnect.vpnagentd.plist**
Those didn't messed up the files content and infact they have set the RunAtLoad to false but didn't disabled the startup.

The other test that I had on this were to delete only the /Library/LaunchAgents/com.cisco.anyconnect.gui.plist as described here https://apple.stackexchange.com/a/269517/361715 which also didn't work for me on Cisco Anyconnect v4.8.xxxxx

**The startup thing is prety annoying asking for connection at startup, or for a password, or a certificate, or so...**

## STEP3
So I have decided two sh scripts for this. One script to **disable** and one script to **enable** it at startup.

**How to use it:**
After you download/clone this project on your Mac, open the Terminal app change the directory (cd) to point where you downloaded and extracted the files then chmod +x those files
eq: 
cd Downloads/Disable_CiscoVPN_at_Startup_MacOSX-master
chmod +x disable_ciscovpn_startup.sh
chmod +x enable_ciscovpn_startup.sh

or one line chmod +x disable_ciscovpn_startup.sh && chmod +x enable_ciscovpn_startup.sh

and run ./disable_ciscovpn_startup.sh to disable the Anyconnect at startup
or ./enable_ciscovpn_startup.sh to enable the Anyconnect at startup

**Note:** You don't need to run those files with **sudo** command. 

## Contribute
If you want to contribute to this script please let me know in the **Issues** section if you find any errors also you may fork it, improve it and so on...

## Tests
The scripts were tested only on MacOSX Catalina 10.15.3 and with Cisco Anyconnect v4.8.00175 as per february 9th, 2020
You may report back your tests also.

## License
This code is under GPL v3 and MIT license also free to use and distribute.
