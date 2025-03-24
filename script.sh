#!/bin/bash

# install my software
sudo apt update
sudo apt install -y git xclip \
python3 \
build-essential \
curl wget unzip tar gzip \
ripgrep fd-find

# install neovim (appimage)
curl -LO https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.appimage
chmod u+x ./nvim-linux-x86_64.appimage
./nvim-linux-x86_64.appimage --appimage-extract
./squashfs-root/AppRun --version
# Optional: exposing nvim globally.
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

# Add my config based on Kickstart.nvim
mkdir ~/.config/nvim
git clone https://github.com/wilyJ80/kickstart.nvim ~/.config/nvim

# lets configure
cd ~/.config/nvim
nvim

# Plugins/LSP
# C: Clangd LSP, CodeLLDB Debugger (needs to compile with debug flags)
# Java: JDTLS LSP, java-debug-adapter debugger, needs Maven project to debug
# HTML/CSS: html-lsp, css-lsp, prettier, emmet
# JavaScript: typescript-language-server, quicklint, standardjs, node-debug2 debugger, also use browser for debugging
# Markdown: marksman
# Dot: dot-language-server
