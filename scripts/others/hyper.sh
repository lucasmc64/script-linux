#!/bin/bash


# -+-+-+-+-+- Variáveis -+-+-+-+-+-

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`


# -+-+-+-+-+- Hyper -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Hyper Terminal -+-+-+-+-+-"
echo "${COLOR_RESET}"

wget -O hyper.deb https://releases.hyper.is/download/deb
sudo dpkg -i ./hyper.deb
sudo apt --fix-broken install -y
sudo rm -rf ./hyper.deb
