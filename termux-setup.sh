#!/usr/bin/env bash

color_scheme_url="https://raw.githubusercontent.com/prateekpunetha/termux-setup/main/colors/colors.properties"
font_url="https://github.com/prateekpunetha/termux-setup/raw/main/fonts/font.ttf"
termux_dir="/data/data/com.termux/files/home/.termux"

# termux update repos
termux-change-repo

# Setup termux storage
termux-setup-storage

# Update packages
yes | pkg update -y

# Install main stuff
pkg install aria2 getconf git neofetch neovim openssh python python-pip termux-api zsh -y

# Change default shell to zsh
chsh -s zsh

# Create a symbolic link for easy access to nvim
ln -s $(where nvim) /data/data/com.termux/files/usr/bin/vim

# Remove nano
yes | pkg remove nano

# Setup color scheme
echo "Installing color schemes..."
curl -so  "$termux_dir/colors.properties" "$color_scheme_url"

# Install font
echo "Installing NERD Fonts..."
curl -so "$termux_dir/font.ttf" "$font_url"
