#!/bin/bash


# => Variáveis 

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`


# => Darktable 

echo "${COLOR_BLUE}"
echo "=> Instalando DarkTable"
echo "${COLOR_RESET}"

sudo apt install darktable -y
