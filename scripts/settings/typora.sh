#!/bin/bash

# => Variáveis

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`

# => Typora

echo "${COLOR_GREEN}"
echo "=> Instalando tema Dracula no Typora"
echo "${COLOR_RESET}"

wget -O typora-dracula-theme.zip https://github.com/dracula/typora/archive/master.zip
unzip typora-dracula-theme.zip
cd ./typora-master
cp -r ./d* ~/.config/Typora/themes
cd ../
rm -rf typora-dracula-theme.zip
rm -rf typora-master

echo "${COLOR_RED}"
echo "AVISO: Caso o haja erro tente abrir o Typora pela primeira vez para ele fazer suas configurações internas iniciais e tente novamente executar essa parte do script."
echo "${COLOR_RESET}"
