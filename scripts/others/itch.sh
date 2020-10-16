#!/bin/bash

# => Variáveis

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`

# => Itch

echo "${COLOR_BLUE}"
echo "=> Instalando Itch"
echo "${COLOR_RESET}"

wget -O itch-setup https://itch.io/app/download?platform=linux
chmod +x itch-setup && ./itch-setup