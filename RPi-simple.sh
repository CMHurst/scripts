#! /usr/bin/bash
promptResponses = ""

printf("\nWould you liek to update, upgrade and clean local repositories?")
read input

if input # Updates, upgrades, and cleans repos
then
    printf("\y\y\y") | sudo apt update && apt upgrade && apt auto-remove
fi
    printf("\nSkipping updates")

