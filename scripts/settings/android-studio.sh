#!/bin/bash

# => Variáveis

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`

# => Android Studio

echo "${COLOR_GREEN}"
echo "=> Adicionando variáveis de Ambiente do Android Studio"
echo "${COLOR_RESET}"

PATH_VARIABLE=`grep "PATH=\"*\"" /etc/environment`
OLD_PATH_CONTENT=`echo ${PATH_VARIABLE:6:${#PATH_VARIABLE}-7}`
ADD_TO_PATH=`echo ":/home/${USER}/Android/Sdk/emulator:/home/${USER}/Android/Sdk/tools:/home/${USER}/Android/Sdk/tools/bin:/home/${USER}/Android/Sdk/platform-tools"`
NEW_PATH_CONTENT=`echo ${OLD_PATH_CONTENT}${ADD_TO_PATH}`
OTHERS_VARIABLES=`grep -v "PATH=\"*\"" /etc/environment`
ANDROID_VARIABLES=`printf "ANDROID_HOME=\"/home/${USER}/Android/Sdk\"\n"`
sudo apt update
sudo printf "PATH=\"${NEW_PATH_CONTENT}\"\n\n${OTHERS_VARIABLES}\n\n${ANDROID_VARIABLES}" > /etc/environment
