#! /usr/bin/bash

read -n1 -p "Would you like to install ZeroTier? [y, N]" zt


#sudo apt-get update && apt-get upgrade -y && apt-get auto-remove -y

if [[ $zt == "Y" || $zt == "y" ]]; then
    echo "true"
else
    echo "false"

fi