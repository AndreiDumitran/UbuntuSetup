#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
cd ~/Desktop
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
sudo rm -rf neovim

#LUNARVIM - INSTALL & CONFIG
#paste command set clipboard+=unnamedplus
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

#FONTS
cd ~/Desktop
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Mononoki.zip
unzip Mononoki.zip -d ~/.fonts
fc-cache -fv
sudo rm Mononoki.zip

#ZSH - CUSTOMISED
# TUTORIAL - https://dev.to/andrenbrandao/terminal-setup-with-zsh-tmux-dracula-theme-48lm
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cd ~/Desktop/UbunutuSetup
sudo rm ~/.zshrc
sudo cp zshrc ~/.zshrc
source ~/.zshrc

#TMUX - CONFIG
cd ~/Desktop
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cd ~/Desktop/UbuntuSetup/
sudo cp tmux.conf ~/.tmux.conf


#CLEANING
cd ~/Desktop/
sudo rm -rf UbuntuSetup
sudo reboot
