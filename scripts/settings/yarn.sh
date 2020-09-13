#!/bin/bash

# => Variáveis

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`

# => Yarn

echo "${COLOR_BLUE}"
echo "=> Habilitando emojis no Yarn"
echo "${COLOR_RESET}"

yarn config set -- --emoji true
