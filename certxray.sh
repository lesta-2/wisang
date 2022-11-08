#!/bin/bash
RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
echo -e "\e[32mPermission Accepted...\e[0m"
clear
echo -e ""
source /var/lib/premium-script/ipvps.conf
domain=$IP
systemctl stop nginx
systemctl stop xray@trojan
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
systemctl daemon-reload
systemctl restart nginx
systemctl daemon-reload
systemctl restart xray@trojan
systemctl enable xray@trojan
echo Done
sleep 0.5
clear 
neofetch
service-info
