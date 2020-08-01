#!/bin/bash

# Este script está sendo criado no Pop!_OS 20.04. Possivelmente irá funcionar em outro SO baseado no Ubuntu ou Debian.


# -+-+-+-+-+- Variáveis -+-+-+-+-+-

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`


# -+-+-+-+-+- Iniciando instalações -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Iniciando instalações -+-+-+-+-+-"
echo "${COLOR_RESET}"

# cd ~/Downloads


# -+-+-+-+-+- APT -+-+-+-+-+-

./scripts/apps-apt.sh

# -+-+-+-+-+- SNAP -+-+-+-+-+-

./scripts/apps-snap.sh

# -+-+-+-+-+- Flatpak -+-+-+-+-+-

./scripts/apps-flatpak.sh

# -+-+-+-+-+- Others -+-+-+-+-+-

./scripts/apps-others.sh

# -+-+-+-+-+- Settings -+-+-+-+-+-

./scripts/settings.sh

# -+-+-+-+-+- Finalizando instalações -+-+-+-+-+-

echo "${COLOR_GREEN}"
echo "-+-+-+-+-+- Finalizando instalações -+-+-+-+-+-"
echo "-+-+-+-+- Leia o README para terminar -+-+-+-+-"
echo "${COLOR_RESET}"