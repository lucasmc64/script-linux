#!/bin/bash

# => Variáveis

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`

# => JetBrains ToolBox

echo "${COLOR_BLUE}"
echo "=> Instalando JetBrains Toolbox"
echo "${COLOR_RESET}"

wget -O jetbrains-toolbox-1.17.7275.tar.gz https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.17.7275.tar.gz
sudo tar -xvzf ./jetbrains-toolbox-1.17.7275.tar.gz
sudo chmod -R u+x ./jetbrains-toolbox-1.17.7275
./jetbrains-toolbox-1.17.7275/jetbrains-toolbox
sudo rm -rf ./jetbrains-toolbox-1.17.7275.tar.gz
sudo rm -rf ./jetbrains-toolbox-1.17.7275
