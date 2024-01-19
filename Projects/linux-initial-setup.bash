#!/bin/bash

#Check that user did not type sh ./filename by mistake
INTERPRETER=$(ps h -p $$ -o args='' | cut -f1 -d' ')
if [ "$INTERPRETER" != "/bin/bash" ];
then
	echo "Use chmod u+x to give script permission to run as a program and then run it directly"
	exit 1
fi

#Check if shell has root
CURRENT_USER=$(whoami)
if [ "$CURRENT_USER" == "root" ]; 
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

cowsay "SCRIPT COMPLETE" | lolcat

