#!/bin/bash


# -+-+-+-+-+- Variáveis -+-+-+-+-+-

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`


# -+-+-+-+-+- Microsoft Teams -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Microsoft Teams -+-+-+-+-+-"
echo "${COLOR_RESET}"

wget -O msteams.deb https://go.microsoft.com/fwlink/p/?linkid=2112886&clcid=0x409&culture=en-us&country=us
sudo dpkg -i ./msteams.deb
sudo rm -rf ./msteams.deb
sudo apt --fix-broken install -y
