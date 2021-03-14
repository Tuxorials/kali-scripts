#!/bin/zsh
clear
IP=$1
figlet KScripts
echo "                             by Tuxorials"
echo -e "\e[1mScanning Webserver\e[0m"
nikto=$(nikto -h $IP)
serverversion=$(echo $nikto | tail -n +8 | head -n +1)
clear
figlet KScripts
echo "                             by Tuxorials"
echo -e "\e[1mScanning Commonly used Sites\e[0m"
gobu=$(gobuster dir -q -u http://$IP -w /usr/share/dirb/wordlists/common.txt -x .php,.html,.txt,.zip,.jpg,.js,.css)
clear
figlet KScripts
echo "                             by Tuxorials"
echo -e "\e[1;91mServer Software:"
echo -e "\e[1;92m"+$serverversion
echo -e "\e[1;91mMaybe relevant sites:"
echo -e "\e[1;92m"+ $gobu
