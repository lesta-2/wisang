#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Start Update"
# update
apt-get install ruby
gem install lolcat
apt-get install figlet
cd /usr/bin
wget -O menu "https://raw.githubusercontent.com/lesta-2/wisang/main/update/menu.sh"
wget -O l2tp "https://raw.githubusercontent.com/lesta-2/wisang/main/update/l2tp.sh"
wget -O ssh "https://raw.githubusercontent.com/lesta-2/wisang/main/update/ssh.sh"
wget -O ssssr "https://raw.githubusercontent.com/lesta-2/wisang/main/update/ssssr.sh"
wget -O sstpp "https://raw.githubusercontent.com/lesta-2/wisang/main/update/sstpp.sh"
wget -O menu-vmess "https://raw.githubusercontent.com/liuuufey/xray/main/menu-vmess.sh"
wget -O menu-vless "https://raw.githubusercontent.com/liuuufey/xray/main/menu-vless.sh"
wget -O menu-trojan "https://raw.githubusercontent.com/liuuufey/xray/main/menu-trojan.sh"
wget -O menu-trojanws "https://raw.githubusercontent.com/liuuufey/xray/main/menu-trojanws.sh"
wget -O wgr "https://raw.githubusercontent.com/lesta-2/wisang/main/update/wgr.sh"
wget -O bbr "https://raw.githubusercontent.com/lesta-2/wisang/main/update/bbr.sh"
chmod +x menu
chmod +x l2tp
chmod +x ssh
chmod +x ssssr
chmod +x sstpp
chmod +x menu-vmess
chmod +x menu-vless
chmod +x menu-trojan
chmod +x menu-trojanws
chmod +x wgr
chmod +x bbr

echo "0 5 * * * root clear-log && reboot" > /etc/crontab
echo "0 0 * * * root xp" > /etc/crontab
clear
echo " Fix minor Bugs"
echo " Now You Can Change Port Of Some Services"
echo " Reboot 5 Sec"
sleep 5
rm -f update.sh
reboot
