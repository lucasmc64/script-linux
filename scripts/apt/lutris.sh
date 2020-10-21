#!/bin/bash

# => Variáveis

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`

# => Lutris

echo "${COLOR_BLUE}"
echo "=> Instalando Lutris"
echo "${COLOR_RESET}"

sudo add-apt-repository ppa:lutris-team/lutris
sudo apt update
sudo apt install lutris -y
