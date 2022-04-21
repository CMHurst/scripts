#! /usr/bin/bash
promptResponses = ""
zt = 0
ztpersonal = 0

printf ("\nThis script will automatically update, upgrade, and clean repositories; in addition to installing software if desired",\n\r)

printf("Would you like to install ZeroTier?")
read zt

if zt
then
    printf(\n, "Would you like to connect to personal ZeroTier group?")
    read ztpersonal
fi
    print(\n, "Zerotier skipped", \n)

printf()

printf("y\y\y") | sudo apt update && apt upgrade && apt auto-remove


if zt
then # Install ZeroTier
    curl -s https://install.zerotier.com | sudo bash
    sudo systemctl enable zerotier-one

    if ztpersonal # Connect to Personal network
        sudo zerotier-cli join 3efa5cb78a19db4e
        printf(\n,"Personal Zerotier network joined:")
        sudo zerotier-cli listnetworks
        printf(\n)

    
    

