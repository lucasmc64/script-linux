#!/bin/bash

# Este script está sendo criado no Pop!_OS 20.04. Possivelmente irá funcionar em outro SO baseado no Ubuntu ou Debian.

# => Variáveis

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`

# => Iniciando instalações

echo "${COLOR_BLUE}"
echo "=> Iniciando instalações"
echo "${COLOR_RESET}"

# => Configurando o ambiente

echo "${COLOR_BLUE}"
echo "=> Configurando o ambiente"
echo "${COLOR_RESET}"

mkdir ~/Android
mkdir ~/Android/Sdk

# => APT 

sudo ./scripts/apt/update.sh
sudo ./scripts/apt/curl.sh
sudo ./scripts/apt/dconf.sh
sudo ./scripts/apt/git.sh
sudo ./scripts/apt/firefox.sh
sudo ./scripts/apt/gnome-boxes.sh
sudo ./scripts/apt/gnome-tweaks.sh
sudo ./scripts/apt/google-chrome.sh
sudo ./scripts/apt/insomnia.sh
sudo ./scripts/apt/krita.sh
sudo ./scripts/apt/kvm.sh
sudo ./scripts/apt/libreoffice.sh
sudo ./scripts/apt/libs-graficas.sh
sudo ./scripts/apt/lutris.sh
sudo ./scripts/apt/node.sh
sudo ./scripts/apt/obs-studio.sh
sudo ./scripts/apt/opera.sh
sudo ./scripts/apt/postgresql.sh
sudo ./scripts/apt/python.sh
sudo ./scripts/apt/ruby.sh
sudo ./scripts/apt/sqlite.sh
sudo ./scripts/apt/steam.sh
sudo ./scripts/apt/typora.sh
sudo ./scripts/apt/unrar.sh
sudo ./scripts/apt/vim.sh
sudo ./scripts/apt/visual-studio-code.sh
sudo ./scripts/apt/vivaldi.sh
sudo ./scripts/apt/vlc.sh
sudo ./scripts/apt/zsh.sh
sudo ./scripts/apt/flatpak.sh
sudo ./scripts/apt/snapd.sh
sudo ./scripts/apt/update.sh

# => SNAP 

sudo ./scripts/snap/update.sh
sudo ./scripts/snap/sosumi.sh
sudo ./scripts/snap/update.sh

# => Flatpak 

./scripts/flatpak/update.sh
./scripts/flatpak/flathub.sh
./scripts/flatpak/audacity.sh
./scripts/flatpak/blender.sh
./scripts/flatpak/darktable.sh
./scripts/flatpak/discord.sh
./scripts/flatpak/foliate.sh
./scripts/flatpak/gimp.sh
./scripts/flatpak/inkscape.sh
./scripts/flatpak/kdenlive.sh
./scripts/flatpak/libresprite.sh
./scripts/flatpak/pixelorama.sh
./scripts/flatpak/rawtherapee.sh
./scripts/flatpak/spotify.sh
./scripts/flatpak/telegram.sh
./scripts/flatpak/update.sh

# => Others

sudo ./scripts/others/android-studio.sh
sudo ./scripts/others/expo.sh
sudo ./scripts/others/free-download-manager.sh
sudo ./scripts/others/itch.sh
sudo ./scripts/others/jdk8.sh
sudo ./scripts/others/postbird.sh
sudo ./scripts/others/rclone.sh
sudo ./scripts/others/react.sh
sudo ./scripts/others/yarn.sh

# => Settings 

# => Android Studio

sudo ./scripts/settings/android-studio.sh

# => Git

./scripts/settings/git.sh

# => KVM

./scripts/settings/kvm.sh

# => Telegram

./scripts/settings/telegram.sh

# => Typora

./scripts/settings/typora.sh

# => Yarn

./scripts/settings/yarn.sh

# => Finalizando instalações 

echo "${COLOR_GREEN}"
echo "=> Finalizando instalações"
echo "=> Leia o README para terminar"
echo "${COLOR_RESET}"
