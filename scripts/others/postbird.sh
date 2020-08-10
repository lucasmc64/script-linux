#!/bin/bash


# -+-+-+-+-+- Variáveis -+-+-+-+-+-

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`


# -+-+-+-+-+- Postbird -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Postbird -+-+-+-+-+-"
echo "${COLOR_RESET}"

url=$(curl -s https://www.electronjs.org/apps/postbird | grep -E ".*postbird.*amd64.*deb" | sed "s/.*href=\"//g;s/\".*//g" | head -n 1)
wget -O postbird.deb $url
sudo dpkg -i ./postbird.deb
sudo apt --fix-broken install -y
sudo rm -rf ./postbird.deb
