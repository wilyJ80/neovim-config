#!/bin/bash

#install my software
sudo apt update
sudo apt install -y git xclip build-essential openjdk-17-jdk maven python3 curl wget unzip tar gzip

#copy files needed
mkdir ~/.config/nvim
cd ~/neovim-config/
cp -f init.lua ~/.config/nvim
cp -f packer.lua ~/.config/nvim/

#install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
#./nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
# Optional: exposing nvim globally.
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
#nvim

#install packer manager
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

#lets configure
cd ~/.config/nvim
nvim
