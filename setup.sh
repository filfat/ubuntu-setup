#!/bin/bash

echo Adding keys and repos...
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

echo Updating system...
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y

echo Installing tools...
sudo apt install -y git docker build-essential clang yarn wget

echo Installing C++ libraries...
sudo apt install -y libsdl2-dev libsdl2-ttf-dev

echo Setting up icons, theme and fonts...
mkdir ~/.icons
mkdir ~/.themes
mkdir ~/.fonts
# TODO: wget theme, icons & font

echo Configuring GNOME...
# TODO: Configure window action buttons
# TODO: Confugure theme
# TODO: Configure icons
# TODO: Configure fonts
