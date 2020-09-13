#!/bin/bash

# => Variáveis

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`

# => Git

echo "${COLOR_BLUE}"
echo "=> Instalando Git"
echo "${COLOR_RESET}"

add-apt-repository ppa:git-core/ppa -y
apt update
sudo apt install git git-man -y
