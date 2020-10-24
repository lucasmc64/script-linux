#!/bin/bash

# => Variáveis

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`

# => Atualizando os repositórios e, após isso, o SO

echo "${COLOR_RED}"
echo "=> Atualizando repositórios e pragramas instalados"
echo "${COLOR_RESET}"

sudo apt clean &&
sudo apt update -m &&
sudo dpkg ––configure –a &&
sudo apt install -f &&
sudo apt dist-upgrade --fix-missing -y &&
sudo apt upgrade -y &&
sudo apt autoclean &&
sudo apt autoremove --purge -y
