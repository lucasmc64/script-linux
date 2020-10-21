#!/bin/bash

# => Variáveis

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`

# => Krita

echo "${COLOR_BLUE}"
echo "=> Instalando Krita"
echo "${COLOR_RESET}"

sudo add-apt-repository ppa:kritalime/ppa -y &&
sudo apt update &&
sudo apt install krita -y &&
sudo apt install krita-l10n -y &&
sudo add-apt-repository \ 
"http://ppa.launchpad.net/kritalime/ppa/ubuntu main/debug" &&
sudo apt update &&
sudo apt install krita-dbgsym -y
