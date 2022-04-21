#! /usr/bin/bash
promptResponses = ""
promptResponses += "y"
promptResponses += "y"

printf promptResponses | sudo apt update && apt upgrade

