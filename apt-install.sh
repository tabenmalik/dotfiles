#!/bin/bash

# Install Brave web browser. TODO: should this be in its own script?
# Pre reqs for getting Brave. May already have them
apt install -y apt-transport-https curl
# Add Brave GPG key to kering 
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
# Add browser repository to apt list with Brave's GPG key
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
# Install Brave
apt update
apt install -y brave-browser


apt-get update
apt-get install vim git
