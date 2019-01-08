#!/bin/bash

echo Adding keys and repos...
sudo apt install -y curl
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

echo Updating system...
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y

echo Installing tools...
sudo apt install -y git docker build-essential clang yarn wget gnome-tweak-tool

echo Installing C++ libraries...
sudo apt install -y libsdl2-dev libsdl2-ttf-dev

echo Setting up icons, theme and fonts...
mkdir ~/.icons
mkdir ~/.themes
mkdir ~/.fonts

wget https://dl.opendesktop.org/api/files/download/id/1546860792/s/e9b3577dc997e00561725bb5f3d7d7ad0a17fd6c54ffefa8744ad2fb70af8b0f38c5398d339a6dca631a7a32a0fb18f048b752d49a8302d523bcbe5c58f65ce4/t/1546911671/u//Mojave-dark-solid.tar.xz
sudo tar -xf Mojave-dark-solid.tar.xz -C ~/.themes
rm -rf Mojave-dark-solid.tar.xz

wget https://dl.opendesktop.org/api/files/download/id/1545202506/s/1cd7e34ffa12ee4a093f8a77821fd17fb358642c0852cdb423ff880e1c14549439aeb192e6f7e97cf7df036690ec7963360d58e01a8f7dc9ee8aa10418cb7c3a/t/1546912396/u//macOS.tar.xz
sudo tar -xf macOS.tar.xz -C~/ .icons
rm -rf macOS.tar.xz

git clone https://github.com/AppleDesignResources/SanFranciscoFont ~/.fonts
rm -rf ~/.fonts/.git

echo Configuring GNOME...
gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"
gsettings set org.gnome.desktop.interface gtk-theme "Mojave-dark-solid"
gsettings set org.gnome.desktop.interface icon-theme "MacOS"

gsettings set org.gnome.desktop.interface document-font-name "San Francisco Text 11"
gsettings set org.gnome.desktop.interface font-name "San Francisco Text 11"

gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED

echo Done!
sudo reboot
