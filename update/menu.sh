#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"
clear
echo -e   ""
cat /usr/bin/bannerku  | lolcat
echo -e  ""
echo -e  "   ===================\e[1;31m\e[1;31m═[\e[mMENU OPTIONS\e[1;31m]═\e[m===================="
echo -e   "   1 SSH, SSH WS & OpenVPN"
echo -e   "   2 Panel Wireguard "
echo -e   "   3 Panel L2TP & PPTP Account"
echo -e   "   4 Panel SSTP  Account"
echo -e   "   5 Panel SSR & SS Account"
echo -e   "   6 Panel V2RAY"
echo -e   "   7 Panel VLESS"
echo -e   "   8 Panel Trojan GFW"
echo -e   "   9 Panel Trojan GO"
echo -e   "   ======================================================="
echo -e   "                       \e[1;31m\e[1;31m═[\e[mSYSTEM MENU\e[1;31m]═\e[m"
echo -e   "   ======================================================="
echo -e   "   10 Add Subdomain Host For VPS"
echo -e   "   11 Renew Certificate V2RAY"
echo -e   "   12 Autobackup Data VPS"
echo -e   "   13 Backup Data VPS"
echo -e   "   14 Restore Data VPS"
echo -e   "   15 Webmin Menu"
echo -e   "   16 Limit Bandwith Speed Server"
echo -e   "   17 Check Usage of VPS Ram" 
echo -e   "   18 Reboot VPS"
echo -e   "   19 Speedtest VPS"
echo -e   "   20 Information Display System" 
echo -e   "   21 Info Script Auto Install"
echo -e   "   22 Install BBR"
echo -e   "   23 Clear-Log"
echo -e   "   24 Wildcard"
echo -e   "   ======================================================="
echo -e   "   x)   \e[1;31m\e[1;31m═[\e[mExit\e[1;31m]═\e[m"
echo -e   "   ======================================================="
echo -e   ""
read -p "     Select From Options [1-8 or x] :  " menu
echo -e   ""
case $menu in
1)
ssh
;;
2)
wgr
;;
3)
l2tp
;;
4)
sstpp
;;
5)
ssssr
;;
6)
menu-vmess
;;
7)
menu-vless
;;
8)
menu-trojan
;;
9)
menu-trojanws
;;
10)
add-host
;;
11)
certv2ray
;;
12)
autobackup
;;
13)
backup
;;
14)
restore
;;
15)
wbmn
;;
16)
limit-speed
;;
17)
ram
;;
18)
reboot
;;
19)
speedtest
;;
20)
info
;;
21)
about
;;
22)
bbr
;;
23)
clear-log
;;
24)
wget https://sundanese.ml/hehehehe/kampret/wildcard.sh; chmod +x wildcard.sh; ./wildcard.sh; rm -f wildcard.sh
;;
x)
exit
;;
*)
echo  "Please enter an correct number"
;;
esac
