#!/bin/bash

# => Variáveis

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`

# => RClone

echo "${COLOR_BLUE}"
echo "=> Instalando RClone"
echo "${COLOR_RESET}"

wget -O rclone-script.sh https://rclone.org/install.sh
chmod a+x ./rclone-script.sh
./rclone-script.sh
