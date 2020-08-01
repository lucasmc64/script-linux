#!/bin/bash


# -+-+-+-+-+- Variáveis -+-+-+-+-+-

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`


# -+-+-+-+-+- Atualizando os repositórios e, após isso, o SO -+-+-+-+-+-

echo "${COLOR_RED}"
echo "-+-+-+-+-+-+- Atualizando repositórios e pragramas instalados -+-+-+-+-+-+-"
echo "${COLOR_RESET}"

# sudo apt update
# sudo apt upgrade


# -+-+-+-+-+- cURL -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando cURL -+-+-+-+-+-"
echo "${COLOR_RESET}"

# sudo apt install curl


# -+-+-+-+-+- Git -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Git -+-+-+-+-+-"
echo "${COLOR_RESET}"

# add-apt-repository ppa:git-core/ppa -y
# apt update
# apt install git


# -+-+-+-+-+- Gnome Boxes -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Gnome Boxes -+-+-+-+-+-"
echo "${COLOR_RESET}"

# sudo apt install gnome-boxes -y


# -+-+-+-+-+- Gnome Tweaks -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Gnome Tweaks -+-+-+-+-+-"
echo "${COLOR_RESET}"

# sudo apt install gnome-tweaks -y


# -+-+-+-+-+- Google Chrome -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Google Chrome -+-+-+-+-+-"
echo "${COLOR_RESET}"

# sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome-stable.list'
# wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
# sudo apt update
# sudo apt install google-chrome-stable -y


# -+-+-+-+-+- InkScape -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando InkScape -+-+-+-+-+-"
echo "${COLOR_RESET}"

# sudo add-apt-repository ppa:inkscape.dev/stable -y
# sudo apt update
# sudo apt install inkscape -y


# -+-+-+-+-+- Insomnia Core -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Insomnia Core -+-+-+-+-+-"
echo "${COLOR_RESET}"

# echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
#     | sudo tee -a /etc/apt/sources.list.d/insomnia.list
# wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
#     | sudo apt-key add -
# sudo apt update
# sudo apt install insomnia -y


# -+-+-+-+-+- Krita -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Krita -+-+-+-+-+-"
echo "${COLOR_RESET}"

# sudo add-apt-repository ppa:kritalime/ppa
# sudo apt update
# sudo apt install krita -y
# sudo apt install krita-l10n -y
# sudo add-apt-repository \
# "http://ppa.launchpad.net/kritalime/ppa/ubuntu main/debug"
# sudo apt update
# sudo apt install krita-dbgsym -y


# -+-+-+-+-+- KVM -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando KVM -+-+-+-+-+-"
echo "${COLOR_RESET}"

# sudo apt-get install cpu-checker
# egrep -c '(vmx|svm)' /proc/cpuinfo
# kvm-ok
# sudo apt install qemu-kvm
# sudo adduser $USER kvm


# -+-+-+-+-+- Libs Gráficas -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Libs Gráficas -+-+-+-+-+-"
echo "${COLOR_RESET}"
# sudo apt install gcc-multilib lib32z1 lib32stdc++6 -y


# -+-+-+-+-+- Node -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Node -+-+-+-+-+-"
echo "${COLOR_RESET}"

# curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
# sudo apt install -y nodejs
# node -v
# npm -v

# -+-+-+-+-+- OBS Studio -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando OBS Studio -+-+-+-+-+-"
echo "${COLOR_RESET}"

# sudo apt install ffmpeg -y
# sudo add-apt-repository ppa:obsproject/obs-studio
# sudo apt update && sudo apt install obs-studio -y


# -+-+-+-+-+- PostgreSQL -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando PostgreSQL -+-+-+-+-+-"
echo "${COLOR_RESET}"

# sudo sh -c 'echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
# wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
# sudo apt update
# sudo apt install postgresql postgresql-12 postgresql-client-12 postgresql-contrib libpq-dev postgresql-server-dev-12 pgadmin4 -y


# -+-+-+-+-+- Python 3 -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Python 3 -+-+-+-+-+-"
echo "${COLOR_RESET}"

# sudo apt install python3
# python3 --version

# -+-+-+-+-+- Spotify -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Spotify -+-+-+-+-+-"
echo "${COLOR_RESET}"

# curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
# echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
# sudo apt update
# sudo apt install spotify-client -y


# -+-+-+-+-+- Typora -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Typora -+-+-+-+-+-"
echo "${COLOR_RESET}"

# wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
# sudo add-apt-repository 'deb https://typora.io/linux ./'
# sudo apt update
# sudo apt install typora -y


# -+-+-+-+-+- Unrar -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Unrar -+-+-+-+-+-"
echo "${COLOR_RESET}"

# sudo apt install unrar -y


# -+-+-+-+-+- Vim -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Vim -+-+-+-+-+-"
echo "${COLOR_RESET}"

# sudo apt install vim -y


# -+-+-+-+-+- Visual Studio Code -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Visual Studio Code -+-+-+-+-+-"
echo "${COLOR_RESET}"

# curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
# sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
# sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
# sudo apt install apt-transport-https -y
# sudo apt update
# sudo apt install code # ou code-insiders -y


# -+-+-+-+-+- Vivaldi -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Vivaldi -+-+-+-+-+-"
echo "${COLOR_RESET}"

# wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
# sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main'
# sudo apt update && sudo apt install vivaldi-stable -y


# -+-+-+-+-+- Suporte a Flatpak -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Suporte à Flatpaks -+-+-+-+-+-"
echo "${COLOR_RESET}"

# sudo apt install flatpak


# -+-+-+-+-+- Suporte a Snaps -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Suporte à Snaps (snapd) -+-+-+-+-+-"
echo "${COLOR_RESET}"

# sudo apt update
# sudo apt install snapd -y


# -+-+-+-+-+- Finalizando com as instalações via Apt -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Checando atualizações -+-+-+-+-+-"
echo "${COLOR_RESET}"

# sudo apt update
# sudo apt upgrade
# sudo apt autoremove