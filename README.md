# EVIL - TWIN

As name suggest this is an evil-twin attack script. Works on WPA/WPA2 access points by creating a captive portal based evil twin. Based on NodeJS web server and bash scripts.

## Author

Mayank Metha

## Version  

1.1

## LICENSE

 GPL-3.0

## Disclaimer
This tool is only for educational purpose. The author is not responsible for the damage caused by this tool on others. Do not use this tool to harm others.

## Requirements

1) A kali linux system
2) 2 WLAN Cards

## Setup

Assuming your working directory is eviltwin folder in the terminal, run the following command:

`cd install;chmod +x install.sh;./install.sh;cd ..`

## SSL

Assuming your working directory is eviltwin folder in the terminal, run the following command:

`mkdir ssl;openssl req -new -newkey rsa:2048 -nodes -out ./ssl/mydomain.csr -keyout ./ssl/private.key`

`openssl x509 -signkey private.key -in ./ssl/mydomain.csr -req -days 1000 -out ./ssl/private.crt`

## Run the attack

First capture an handshake file using `airodump-ng`. Then assuming your working directory is eviltwin folder in the terminal, run the following command:

`./eviltwin.sh`

## Modification

Website files are located in the directory sites. Feel free to modify the HTML/CSS content of the file to your requirements.

## Supported WLAN Card Drivers

1) rtl8812au
2) iwlwifi (txpower doesn't seem to work)
