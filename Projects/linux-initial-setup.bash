#!/bin/bash

#Run
# wget https://raw.githubusercontent.com/Moses613/random-code-projects/main/Projects/linux-initial-setup.bash
#to download this

#Check that user did not type sh ./filename by mistake
INTERPRETER=$(ps h -p $$ -o args='' | cut -f1 -d' ')
if [ "$INTERPRETER" != "/bin/bash" ];
then
	echo "Use chmod u+x to give script permission to run as a program and then run it directly"
	exit 1
fi

#Check if shell has root
if [ "${UID}" -eq 0 ];
then
	echo "You are root."
	echo "Run script again without initially typing sudo"
	exit 1
fi

#Install Stuff
#Ubuntu
if grep -iq 'ubuntu' /etc/*-release;
then
	sudo apt update
	sudo apt upgrade
	sudo apt-get install cowsay cowsay-off fortune git gh tmux sl lolcat cava neofetch
	echo
	echo
#openSUSE
elif grep -iq 'opensuse' /etc/*-release;
then
	sudo zypper ref
	sudo zypper up
	sudo zypper in cowsay fortune git gh tmux sl cava neofetch distrobox gstreamer-plugins-bad gstreamer-plugins-ugly clementine
#RHEL
elif grep -iq 'Red Hat' /etc/*-release;
then
	echo "Use your Ansible Podman login here:"
	podman login registry.redhat.io
	sudo dnf check-update
	sudo dnf upgrade
	sudo dnf install ansible-core ansible-navigator tmux
else
	echo "ERROR: Unknown OS"
	exit 1
fi

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

#clone this repo
cd ~
git clone https://github.com/Moses613/random-code-projects
echo
echo

#Messages
echo "Remember to authorize your GitHub account"

cowsay "SCRIPT COMPLETE"

