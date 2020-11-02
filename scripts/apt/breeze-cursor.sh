#!/bin/bash

# => Variáveis

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`

# => Breeze Cursor

echo "${COLOR_BLUE}"
echo "=> Instalando Breeze Cursor"
echo "${COLOR_RESET}"

sudo apt install breeze-cursor-theme -y
