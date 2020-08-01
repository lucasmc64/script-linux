#!/bin/bash

# -+-+-+-+-+- Variáveis -+-+-+-+-+-

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`


# -+-+-+-+-+- Android Studio -+-+-+-+-+-

echo "${COLOR_GREEN}"
echo "-+-+-+-+-+- Adicionando variáveis de Ambiente do Android Studio -+-+-+-+-+-"
echo "${COLOR_RESET}"

# mkdir ~/Android
# mkdir ~/Android/Sdk
# PATH_VARIABLE=`grep "PATH=\"*\"" /etc/environment`
# OLD_PATH_CONTENT=`echo ${PATH_VARIABLE:6:${#PATH_VARIABLE}-7}`
# ADD_TO_PATH=`echo ":~/Android/Sdk/emulator:~/Android/Sdk/tools:~/Android/Sdk/tools/bin:~/Android/Sdk/platform-tools"`
# NEW_PATH_CONTENT=`echo ${OLD_PATH_CONTENT}${ADD_TO_PATH}`
# OTHERS_VARIABLES=`grep -v "PATH=\"*\"" /etc/environment`
# ANDROID_VARIABLES=`printf "ANDROID_HOME=\"~/Android/Sdk\"\n"`
# sudo printf "PATH=\"${NEW_PATH_CONTENT}\"\n\n${OTHERS_VARIABLES}\n\n${ANDROID_VARIABLES}" > /etc/environment


# -+-+-+-+-+- Git -+-+-+-+-+-

echo "${COLOR_GREEN}"
echo "-+-+-+-+-+- Configurando Git -+-+-+-+-+-"
echo "${COLOR_RESET}"

git config --global user.name "Lucas Marçal Coutinho"
git config --global user.email coutinho0604@gmail.com
git config --global core.editor code
git config --list


# -+-+-+-+-+- Typora -+-+-+-+-+-

echo "${COLOR_GREEN}"
echo "-+-+-+-+-+- Instalando tema Dracula no Typora -+-+-+-+-+-"
echo "${COLOR_RESET}"

# wget -O typora-dracula-theme.zip https://github.com/dracula/typora/archive/master.zip
# unzip typora-dracula-theme.zip
# cd ./typora-master
# cp -r ./d* ~/.config/Typora/themes
# cd ~/Downloads
# rm -rf typora-dracula-theme.zip
# rm -rf typora-master
