#! /usr/bin/bash

echo "Would you like to install ZeroTier?"
read zt

sudo apt-get update && apt-get upgrade -y && apt-get auto-remove -y

echo zt

