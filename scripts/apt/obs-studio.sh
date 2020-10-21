#!/bin/bash

# => Variáveis

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`

# => OBS Studio

echo "${COLOR_BLUE}"
echo "=> Instalando OBS Studio"
echo "${COLOR_RESET}"

sudo apt install ffmpeg -y &&
sudo add-apt-repository ppa:obsproject/obs-studio -y &&
sudo apt update &&
sudo apt install obs-studio -y
