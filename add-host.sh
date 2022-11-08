#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"
echo -e "\e[32mPermission Accepted...\e[0m"
clear
read -rp "Domain/Host: " -e host
rm /etc/xray/domain
echo "$host" >> /etc/xray/domain
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf