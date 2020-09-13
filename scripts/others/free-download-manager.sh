#!/bin/bash

# => Variáveis

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`

# => Free Download Manager

echo "${COLOR_BLUE}"
echo "=> Instalando Free Download Manager"
echo "${COLOR_RESET}"

sudo apt install ffmpeg -y
wget -O freedownloadmanager.deb https://dn3.freedownloadmanager.org/6/latest/freedownloadmanager.deb
sudo dpkg -i ./freedownloadmanager.deb
sudo rm -rf ./freedownloadmanager.deb
sudo apt --fix-broken install -y
