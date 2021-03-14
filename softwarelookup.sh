IP=$1
nikto=$(nikto -h $IP)
serverversion=$(echo $nikto | tail -n +8 | head -n +1)
gobu=$(gobuster dir -q -u http://$IP -w /usr/share/dirb/wordlists/common.txt -x .php,.html,.txt,.zip,.jpg,.js,.css | tail -n +16 | head -n -4)
echo "Server Software:"
echo $serverversion
echo "Maybe relevant sites:"
echo $gobu
