#!/usr/bin/env bash

color_scheme_url="https://github.com/prateekpunetha/termux-setup/raw/main/colors/colors.properties"
font_url="https://github.com/prateekpunetha/termux-setup/raw/main/fonts/font.ttf"
starship_config_url="https://github.com/prateekpunetha/termux-setup/raw/main/config_files/starship/config.toml"
termux_dir="$HOME/.termux"

# Termux update repos
termux-change-repo

# Setup termux storage
termux-setup-storage

# Update packages
yes | pkg update && pkg upgrade

# Install main stuff
pkg install aria2 bat ffmpeg git fastfetch neovim openssh python python-pip starship termux-api which zsh -y

# Install yt-dlp (youtube-dl)
pip install yt-dlp

# Change default shell to zsh
chsh -s zsh

# Setup starship
echo "eval \$(starship init zsh)" >> $HOME/.zshrc

mkdir -p $HOME/.config
curl -sSL -o $HOME/.config/starship.toml "$starship_config_url"

# Create a symbolic link for easy access to nvim and yt-dlp
ln -s $(which nvim) $PREFIX/bin/vim
ln -s $(which yt-dlp) $PREFIX/bin/youtube-dl

# Set some aliases
echo "alias cat=\"bat --style=grid,header\"" >> ~/.zshrc
echo "alias yt-dlp=\"yt-dlp -o '%(title)s.%(ext)s' --external-downloader aria2c --external-downloader-args '-c -j 4 -x 8 -s 8 -k 1M'\"" >> ~/.zshrc

# Remove nano
yes | pkg remove nano

# Setup color scheme
echo "Installing color schemes..."
curl -sSL -o  "$termux_dir/colors.properties" "$color_scheme_url"

# Install font
echo "Installing NERD Fonts..."
curl -sSL -o "$termux_dir/font.ttf" "$font_url"

# Done
echo '\nDone!'
