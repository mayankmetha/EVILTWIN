#!/bin/bash
DIR=`realpath "$0"`
DIR=`dirname "$DIR"`
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
if [[ "`lsb_release -i | cut -f2`" == "Kali" ]]
then
    echo -e "\033[1;37m[\033[0m\033[1;32m✔\033[0m\033[1;37m]\033[0m\033[1;33m distro         \033[0m\033[1;37m:\033[0m\033[1;36m Kali\033[0m"
    echo -ne "\033[1;37m[\033[0m\033[1;31m✘\033[0m\033[1;37m]\033[0m\033[1;33m nodejs         \033[0m\033[1;37m:\033[0m\033[1;36m Checking\033[0m"
    if ! type node > /dev/null 2>&1
    then
        echo -ne "\r\033[1;37m[\033[0m\033[1;31m✘\033[0m\033[1;37m]\033[0m\033[1;33m nodejs         \033[0m\033[1;37m:\033[0m\033[1;36m Installing\033[0m                       "
        curl -sL https://deb.nodesource.com/setup_10.x | bash - > /dev/null 2>&1
        apt-get install -y nodejs > /dev/null 2>&1
        echo -ne "\r\033[1;37m[\033[0m\033[1;32m✔\033[0m\033[1;37m]\033[0m\033[1;33m nodejs         \033[0m\033[1;37m:\033[0m\033[1;36m Installed\033[0m                         \n" 
    else
        echo -ne "\r\033[1;37m[\033[0m\033[1;32m✔\033[0m\033[1;37m]\033[0m\033[1;33m nodejs         \033[0m\033[1;37m:\033[0m\033[1;36m Installed\033[0m                         \n"  
    fi
    echo -ne "\033[1;37m[\033[0m\033[1;31m✘\033[0m\033[1;37m]\033[0m\033[1;33m ifconfig       \033[0m\033[1;37m:\033[0m\033[1;36m Checking\033[0m"
    if ! type ifconfig > /dev/null 2>&1
    then
        echo -ne "\r\033[1;37m[\033[0m\033[1;31m✘\033[0m\033[1;37m]\033[0m\033[1;33m ifconfig       \033[0m\033[1;37m:\033[0m\033[1;36m Installing\033[0m                       "
        apt-get install -y net-tools > /dev/null 2>&1
        echo -ne "\r\033[1;37m[\033[0m\033[1;32m✔\033[0m\033[1;37m]\033[0m\033[1;33m ifconfig       \033[0m\033[1;37m:\033[0m\033[1;36m Installed\033[0m                         \n" 
    else
        echo -ne "\r\033[1;37m[\033[0m\033[1;32m✔\033[0m\033[1;37m]\033[0m\033[1;33m iwconfig       \033[0m\033[1;37m:\033[0m\033[1;36m Installed\033[0m                         \n"  
    fi
    echo -ne "\033[1;37m[\033[0m\033[1;31m✘\033[0m\033[1;37m]\033[0m\033[1;33m iwconfig       \033[0m\033[1;37m:\033[0m\033[1;36m Checking\033[0m"
    if ! type iwconfig > /dev/null 2>&1
    then
        echo -ne "\r\033[1;37m[\033[0m\033[1;31m✘\033[0m\033[1;37m]\033[0m\033[1;33m iwconfig       \033[0m\033[1;37m:\033[0m\033[1;36m Installing\033[0m                       "
        apt-get install -y iw > /dev/null 2>&1
        echo -ne "\r\033[1;37m[\033[0m\033[1;32m✔\033[0m\033[1;37m]\033[0m\033[1;33m iwconfig       \033[0m\033[1;37m:\033[0m\033[1;36m Installed\033[0m                         \n" 
    else
        echo -ne "\r\033[1;37m[\033[0m\033[1;32m✔\033[0m\033[1;37m]\033[0m\033[1;33m iwconfig       \033[0m\033[1;37m:\033[0m\033[1;36m Installed\033[0m                         \n"  
    fi
    echo -ne "\033[1;37m[\033[0m\033[1;31m✘\033[0m\033[1;37m]\033[0m\033[1;33m macchanger     \033[0m\033[1;37m:\033[0m\033[1;36m Checking\033[0m"
    if ! type macchanger > /dev/null 2>&1
    then
        echo -ne "\r\033[1;37m[\033[0m\033[1;31m✘\033[0m\033[1;37m]\033[0m\033[1;33m macchanger     \033[0m\033[1;37m:\033[0m\033[1;36m Installing\033[0m                       "
        apt-get install -y macchanger > /dev/null 2>&1
        echo -ne "\r\033[1;37m[\033[0m\033[1;32m✔\033[0m\033[1;37m]\033[0m\033[1;33m macchanger     \033[0m\033[1;37m:\033[0m\033[1;36m Installed\033[0m                         \n" 
    else
        echo -ne "\r\033[1;37m[\033[0m\033[1;32m✔\033[0m\033[1;37m]\033[0m\033[1;33m macchanger     \033[0m\033[1;37m:\033[0m\033[1;36m Installed\033[0m                         \n"  
    fi
    echo -ne "\033[1;37m[\033[0m\033[1;31m✘\033[0m\033[1;37m]\033[0m\033[1;33m iptables       \033[0m\033[1;37m:\033[0m\033[1;36m Checking\033[0m"
    if ! type iptables > /dev/null 2>&1
    then
        echo -ne "\r\033[1;37m[\033[0m\033[1;31m✘\033[0m\033[1;37m]\033[0m\033[1;33m iptables       \033[0m\033[1;37m:\033[0m\033[1;36m Installing\033[0m                       "
        apt-get install -y iptables > /dev/null 2>&1
        echo -ne "\r\033[1;37m[\033[0m\033[1;32m✔\033[0m\033[1;37m]\033[0m\033[1;33m iptables       \033[0m\033[1;37m:\033[0m\033[1;36m Installed\033[0m                         \n" 
    else
        echo -ne "\r\033[1;37m[\033[0m\033[1;32m✔\033[0m\033[1;37m]\033[0m\033[1;33m iptables       \033[0m\033[1;37m:\033[0m\033[1;36m Installed\033[0m                         \n"  
    fi
    echo -ne "\033[1;37m[\033[0m\033[1;31m✘\033[0m\033[1;37m]\033[0m\033[1;33m hostapd        \033[0m\033[1;37m:\033[0m\033[1;36m Checking\033[0m"
    if ! type hostapd > /dev/null 2>&1
    then
        echo -ne "\r\033[1;37m[\033[0m\033[1;31m✘\033[0m\033[1;37m]\033[0m\033[1;33m hostapd        \033[0m\033[1;37m:\033[0m\033[1;36m Installing\033[0m                       "
        apt-get install -y hostapd > /dev/null 2>&1
        echo -ne "\r\033[1;37m[\033[0m\033[1;32m✔\033[0m\033[1;37m]\033[0m\033[1;33m hostapd        \033[0m\033[1;37m:\033[0m\033[1;36m Installed\033[0m                         \n" 
    else
        echo -ne "\r\033[1;37m[\033[0m\033[1;32m✔\033[0m\033[1;37m]\033[0m\033[1;33m hostapd        \033[0m\033[1;37m:\033[0m\033[1;36m Installed\033[0m                         \n"  
    fi
    echo -ne "\033[1;37m[\033[0m\033[1;31m✘\033[0m\033[1;37m]\033[0m\033[1;33m dnsmasq        \033[0m\033[1;37m:\033[0m\033[1;36m Checking\033[0m"
    if ! type dnsmasq > /dev/null 2>&1
    then
        echo -ne "\r\033[1;37m[\033[0m\033[1;31m✘\033[0m\033[1;37m]\033[0m\033[1;33m dnsmasq        \033[0m\033[1;37m:\033[0m\033[1;36m Installing\033[0m                       "
        apt-get install -y dnsmasq > /dev/null 2>&1
        echo -ne "\r\033[1;37m[\033[0m\033[1;32m✔\033[0m\033[1;37m]\033[0m\033[1;33m dnsmasq        \033[0m\033[1;37m:\033[0m\033[1;36m Installed\033[0m                         \n" 
    else
        echo -ne "\r\033[1;37m[\033[0m\033[1;32m✔\033[0m\033[1;37m]\033[0m\033[1;33m dnsmasq        \033[0m\033[1;37m:\033[0m\033[1;36m Installed\033[0m                         \n"  
    fi
    echo -ne "\033[1;37m[\033[0m\033[1;31m✘\033[0m\033[1;37m]\033[0m\033[1;33m aircrack-ng    \033[0m\033[1;37m:\033[0m\033[1;36m Checking\033[0m"
    if ! type aircrack-ng > /dev/null 2>&1
    then
        echo -ne "\r\033[1;37m[\033[0m\033[1;31m✘\033[0m\033[1;37m]\033[0m\033[1;33m aircrack-ng    \033[0m\033[1;37m:\033[0m\033[1;36m Installing\033[0m                       "
        apt-get install -y aircrack-ng > /dev/null 2>&1
        echo -ne "\r\033[1;37m[\033[0m\033[1;32m✔\033[0m\033[1;37m]\033[0m\033[1;33m aircrack-ng    \033[0m\033[1;37m:\033[0m\033[1;36m Installed\033[0m                         \n" 
    else
        echo -ne "\r\033[1;37m[\033[0m\033[1;32m✔\033[0m\033[1;37m]\033[0m\033[1;33m aircrack-ng    \033[0m\033[1;37m:\033[0m\033[1;36m Installed\033[0m                         \n"  
    fi
    cd $PDIR
    echo -ne "\033[1;37m[\033[0m\033[1;31m✘\033[0m\033[1;37m]\033[0m\033[1;33m dependencies   \033[0m\033[1;37m:\033[0m\033[1;36m Installing\033[0m"
    npm install > /dev/null 2>&1
    echo -ne "\r\033[1;37m[\033[0m\033[1;32m✔\033[0m\033[1;37m]\033[0m\033[1;33m dependencies   \033[0m\033[1;37m:\033[0m\033[1;36m Installed\033[0m                         \n" 
    echo -ne "\033[1;37m[\033[0m\033[1;31m✘\033[0m\033[1;37m]\033[0m\033[1;33m permissions    \033[0m\033[1;37m:\033[0m\033[1;36m Checking\033[0m"
    chmod +x eviltwin.sh
    echo -ne "\r\033[1;37m[\033[0m\033[1;32m✔\033[0m\033[1;37m]\033[0m\033[1;33m permissions    \033[0m\033[1;37m:\033[0m\033[1;36m Fixed\033[0m                         \n" 
else
    echo -e "\033[1;37m[\033[0m\033[1;31m✘\033[0m\033[1;37m]\033[0m\033[1;33m OS             \033[0m\033[1;37m:\033[0m\033[1;36m Not Supported\033[0m"
    exit 0
fi