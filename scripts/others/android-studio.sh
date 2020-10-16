#!/bin/bash

# => Variáveis

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`

# => Android Studio

echo "${COLOR_BLUE}"
echo "=> Instalando Android Studio"
echo "${COLOR_RESET}"

url=$(curl -s https://developer.android.com/studio | grep -E "redirector.*linux.tar.gz" | grep -v "Linux" | sed "s/.*href=\"//g;s/\".*//g")
wget -O android-studio.tar.gz $url
sudo tar -xvzf ./android-studio.tar.gz
sudo mv ./android-studio /usr/share
sudo rm -rf ./android-studio.tar.gz
sudo cp /etc/environment /etc/environment.bkp
PATH_VARIABLE=`grep "PATH=\"*\"" /etc/environment`
OLD_PATH_CONTENT=`echo ${PATH_VARIABLE:6:${#PATH_VARIABLE}-7}`
ADD_TO_PATH=`echo ":/usr/share/android-studio/bin"`
NEW_PATH_CONTENT=`echo ${OLD_PATH_CONTENT}${ADD_TO_PATH}`
OTHERS_VARIABLES=`grep -v "PATH=\"*\"" /etc/environment`
sudo printf "PATH=\"${NEW_PATH_CONTENT}\"\n${OTHERS_VARIABLES}" > /etc/environment
studio.sh
