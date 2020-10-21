#!/bin/bash

# => Variáveis

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`

# => Python 3

echo "${COLOR_BLUE}"
echo "=> Instalando Python 3"
echo "${COLOR_RESET}"

sudo apt install python3 -y &&
python3 --version
