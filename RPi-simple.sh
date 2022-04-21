#! /usr/bin/bash

echo "Would you like to update, upgrade and clean local repositories?"
read input

if input == 'y' | input == 'Y' # Updates, upgrades, and cleans repos
then
    echo -n "\y\y\y" | sudo apt update && apt upgrade && apt auto-remove
else
    echo "Skipping updates"
fi


