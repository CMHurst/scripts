#! /usr/bin/bash

printf ("Would you like to update, upgrade and clean local repositories?")
read input

if input # Updates, upgrades, and cleans repos
then
    printf ("\y\y\y") | sudo apt update && apt upgrade && apt auto-remove
else
    printf ("Skipping updates")
fi


