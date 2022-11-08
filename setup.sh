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
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"
clear
if [ -f "/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/premium-script;
echo "IP=" >> /var/lib/premium-script/ipvps.conf
#install ssh ovpn
wget https://raw.githubusercontent.com/lesta-2/wisang/main/cf.sh && chmod +x cf.sh && ./cf.sh
wget https://raw.githubusercontent.com/lesta-2/wisang/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://raw.githubusercontent.com/lesta-2/wisang/main/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
wget https://raw.githubusercontent.com/liuuufey/ws/main/weleh.sh && chmod +x weleh.sh && screen -S weleh ./weleh.sh
#install ssr
wget https://raw.githubusercontent.com/lesta-2/wisang/main/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
wget https://raw.githubusercontent.com/lesta-2/wisang/main/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
#install wg
wget https://raw.githubusercontent.com/lesta-2/wisang/main/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
#install L2TP
wget https://raw.githubusercontent.com/lesta-2/wisang/main/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
wget https://raw.githubusercontent.com/lesta-2/wisang/main/set-br.sh && chmod +x set-br.sh && ./set-br.sh
wget https://raw.githubusercontent.com/lesta-2/wisang/main/gas-xray.sh && chmod +x gas-xray.sh && ./gas-xray.sh

rm -f /root/cf.sh
rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/weleh.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/gas-xray.sh
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://sundanese.ml

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://raw.githubusercontent.com/lesta-2/wisang/main/set.sh"
chmod +x /etc/set.sh
history -c
echo "1.2" > /home/ver
clear
echo " "
echo "Installation has been completed!!"
echo " "
echo "=============-Autoscript Premium-=============" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt
echo "   - Stunnel4                : 222, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - SSH WS SSL              : 443"  | tee -a log-install.txt
echo "   - SSH WS Http             : 2095"  | tee -a log-install.txt
echo "   - SSH WS Ovpn             : 2082"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 85"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 443"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 80"  | tee -a log-install.txt
echo "   - Trojan GFW              : 443"  | tee -a log-install.txt
echo "   - Trojan Go               : 443"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Dev/Main                : RPJ Project"  | tee -a log-install.txt
echo "   - Telegram                : @Wisanggeni58"  | tee -a log-install.txt
echo "---------Script Created By RPJ PROJECT----------" | tee -a log-install.txt
echo ""
echo " Reboot 15 Sec"
sleep 15
rm -f install.sh
rm -f setup.sh
reboot
