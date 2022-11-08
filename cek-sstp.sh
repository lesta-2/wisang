#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"
echo -e "\e[32mPermission Accepted...\e[0m"
clear
accel-cmd show sessions
echo ""