#!/bin/bash
sudo apt update -y
sudo apt upgrade -y

#PACKAGES:
sudo apt install git build-essential xmonad libghc-xmonad-contrib-dev xmobar pip cargo gnome-tweaks dmenu wget curl gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip doxygen zsh-autosuggestions zsh-syntax-highlighting -y

#CHROME:
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
sudo rm google-chrome-stable_current_amd64.deb

#NODEJS - LATEST:
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH
source ~/.profile

#NEOVIM - BUILD
git clone https://github.com/neovim/neovim
cd neovim && make -j4
sudo make install

sudo cd ..
sudo rm neovim

#LUNARVIM - INSTALL & CONFIG
#paste command set clipboard+=unnamedplus
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

chsh -s $(which zsh)
# TUTORIAL - https://dev.to/andrenbrandao/terminal-setup-with-zsh-tmux-dracula-theme-48lm

