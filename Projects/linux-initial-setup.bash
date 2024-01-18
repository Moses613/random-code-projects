#!/bin/bash

echo "Make sure to run this in bash, not accidentally override with sh"
echo

#Check if shell has root
current_user=$(whoami)
if [ "$current_user" == "root" ]; 
then 
	echo "Run script again without initially typing sudo"
	exit 1
fi

#Ubuntu
#Install stuff
sudo apt update
sudo apt upgrade
sudo apt-get install cowsay cowsay-off fortune git gh tmux sl lolcat cava
echo
echo

#Configure tmux
cd ~
wget https://raw.githubusercontent.com/Moses613/random-code-projects/main/Configs/.tmux.conf
echo
echo "tmux config downloaded to home directory"
echo

#configure git
git config --global core.editor "nano"
git config --global user.name "Moses613"
git config --global user.email "44594121+Moses613@users.noreply.github.com" 
echo "git configured"
echo

#Messages 
echo "Remember to authorize your GitHub account"

