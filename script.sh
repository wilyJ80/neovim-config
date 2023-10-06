#!/bin/bash

# install my software
sudo apt update
sudo apt install -y git xclip build-essential openjdk-17-jdk maven python3 curl wget unzip tar gzip npm ripgrep fd-find

# install neovim (appimage)
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
#./nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
# Optional: exposing nvim globally.
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
#nvim

# Add my config based on Kickstart.nvim
mkdir ~/.config/nvim
git clone https://github.com/wilyJ80/kickstart.nvim ~/.config/nvim

# lets configure
cd ~/.config/nvim
nvim
