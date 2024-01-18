#!/bin/bash

#Ubuntu
#Install stuff
sudo apt update
sudo apt-get install cowsay cowsay-off fortune git gh tmux sl lolcat cava

#Configure tmux
cd ~
wget https://raw.githubusercontent.com/Moses613/random-code-projects/main/Configs/.tmux.conf

#configure git
git config --global core.editor "nano"
git config --global user.name "Moses613"
git config --global user.email "44594121+Moses613@users.noreply.github.com" 

#Messages 
echo "Remember to authorize your GitHub account"

