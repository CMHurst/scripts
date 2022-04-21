#! /usr/bin/bash

# Default Values
update = "y"
xdrp = "y"
zt = "n"
ztconnect = "y"
st = "n"
tv = "n"
ph = "n"
ap = "n"

# Update, Upgrade and Autoremove Input
read -n1 -p "Update/Upgrade/Autoremove? [Y,n]:" updateInput
if [ $updateInput == "n" ] || [ $updateInput == "n" ]; then update = "n" fi # Overwrite default

# XDRP Input
read -n1 -p "Install XDRP? [Y,n]:" xdrpInput
if [ $xdrpInput == "n" ] || [ $xdrpInput == "n" ]; then xdrp = "n" fi # Overwrite default

# Zerotier Input
read -n1 -p "Install ZeroTier? [y, N]:" ztInput
if [ $ztInput == "y" ] || [ $ztInput == "Y" ]; then zt = "y" fi # Overwrite default

if [ $zt == "Y" || $zt == "y" ]; then
    read -n1 -p "Connect to personal ZeroTier network? [Y, n]:" ztcInput
    if [ $ztcInput == "n" ] || [ $ztcInput == "n" ]; then ztc = "n" fi # Overwrite default
fi

# Speedtest CLI Input
read -n1 -p "Install speedtest.net CLI? [y, N]:" stInput
if [ $stInput == "y" ] || [ $stInput == "Y" ]; then st = "y" fi # Overwrite default

# Teamviewer Input
read -n1 -p "Install teamviewer host? [y, N]:" tvInput
if [ $tvInput == "y" ] || [ $tvInput == "Y" ]; then tv = "y" fi # Overwrite default


# Pi-Hole Input
read -n1 -p "Install Pi-Hole? [y, N]:" phInput
if [ $phInput == "y" ] || [ $phInput == "Y" ]; then ph = "y" fi # Overwrite default


# Apache Input
read -n1 -p "Install Apache Web Server? [y, N]:" apInput
if [ $apInput == "y" ] || [ $apInput == "Y" ]; then ap = "y" fi # Overwrite default



# Installation Scripts

# Update, Upgrade and Autoremove
if [ $update == "y" ] || [ $update == 'Y' ]; then
    echo "\y\y" | sudo apt-get update && apt-get upgrade -y && apt-get auto-remove -y
fi


# XDRP Install
if [ $xdrp == "y"] || [ $xdrp == "Y" ]; then
    echo "\y" | sudo apt-get install xrdp
fi


# Zerotier Install
if [ $zt == "y" || $zt == "Y" ]; then
    echo "\y" | curl -s https://install.zerotier.com | sudo bash
    sudo systemctl enable zerotier-one
    # Zerotier Network Connect
    if [ $ztc == "y" || $ztc == "Y" ]; then
        sudo zerotier-cli join 3efa5cb78a19db4e
        echo "Connected to"
        echo -n (sudo zerotier-cli listnetworks
    fi
fi


# Speedtest CLi Install
if [ $st == "y" || $st == "Y" ]; then
    echo "\y" | sudo apt-get install speedtest
fi


# Teamviewer Install
if [ $tv == "y"] || [ $tv == "Y" ]; then
    wget https://download.teamviewer.com/download/linux/teamviewer-host_armhf.deb
    sudo dpkg -i teamviewer-host_armhf.deb
    sudo apt --fix-broken install
    sudo teamviewer setup
fi


# Pi-Hole Install
if [ $ph == "y" ] || [ $ph == "Y" ]; then
    wget -O basic-install.sh https://install.pi-hole.net
    echo "\y" | sudo bash basic-install.sh
fi


# Apache Web Server Install
if [ $ap == "y" ] || [ $ap == "Y" ]; then
    echo "\y" | sudo apt install apache2 -y
    cd /var/www/html
    sudo chown pi: index.html
    cd ~
fi
