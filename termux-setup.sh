#!/usr/bin/env bash

color_scheme_url="https://dl.prateekpunetha.dev/colors.properties"
font_url="https://dl.prateekpunetha.dev/font.ttf"
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

# Remove nano
yes | pkg remove nano

# Setup color scheme
echo "Installing color schemes..."
curl -so  "$termux_dir/colors.properties" "$color_scheme_url"

# Install font
echo "Installing NERD Fonts..."
curl -so "$termux_dir/font.ttf" "$font_url"
