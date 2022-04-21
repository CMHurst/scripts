#! /usr/bin/bash

read -n1 -p "Would you like to install ZeroTier? [y, N]" zt


#sudo apt-get update && apt-get upgrade -y && apt-get auto-remove -y

case $zt in
    y|Y) echo "true" ;;
    n|N) echo "false" ;;
    *) echo invalid ;;

esac