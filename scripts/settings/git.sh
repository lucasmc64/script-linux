#!/bin/bash


# -+-+-+-+-+- Variáveis -+-+-+-+-+-

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`


echo "${COLOR_GREEN}"
echo "-+-+-+-+-+- Configurando Git -+-+-+-+-+-"
echo "${COLOR_RESET}"

git config --global user.name "Lucas Marçal Coutinho"
git config --global user.email coutinho0604@gmail.com
git config --global core.editor code
git config --list