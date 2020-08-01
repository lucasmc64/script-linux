#!/bin/bash


# -+-+-+-+-+- Variáveis -+-+-+-+-+-

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`


# -+-+-+-+-+- Suporte ao FlatHub -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Suporte ao FlatHub -+-+-+-+-+-"
echo "${COLOR_RESET}"

flatpak install flathub -y


# -+-+-+-+-+- Audacity -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Audacity -+-+-+-+-+-"
echo "${COLOR_RESET}"

flatpak install org.audacityteam.Audacity -y


# -+-+-+-+-+- Code::Blocks -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando CodeBlocks -+-+-+-+-+-"
echo "${COLOR_RESET}"

flatpak install org.codeblocks.codeblocks -y


# -+-+-+-+-+- Darktable -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando DarkTable -+-+-+-+-+-"
echo "${COLOR_RESET}"

flatpak install org.darktable.Darktable -y


# -+-+-+-+-+- Discord -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Discord -+-+-+-+-+-"
echo "${COLOR_RESET}"

flatpak install com.discordapp.Discord -y


# -+-+-+-+-+- Ferdi -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Ferdi -+-+-+-+-+-"
echo "${COLOR_RESET}"

flatpak install com.getferdi.Ferdi -y


# -+-+-+-+-+- GIMP -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando GIMP -+-+-+-+-+-"
echo "${COLOR_RESET}"

flatpak install org.gimp.GIMP -y


# -+-+-+-+-+- LibreOffice -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando LibreOffice -+-+-+-+-+-"
echo "${COLOR_RESET}"

flatpak install org.libreoffice.LibreOffice -y


# -+-+-+-+-+- Netbeans -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Netbeans -+-+-+-+-+-"
echo "${COLOR_RESET}"

flatpak install org.apache.netbeans -y


# -+-+-+-+-+- RawTherapee -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando RawTherapee -+-+-+-+-+-"
echo "${COLOR_RESET}"

flatpak install com.rawtherapee.RawTherapee -y


# -+-+-+-+-+- Spotify -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Spotify -+-+-+-+-+-"
echo "${COLOR_RESET}"

flatpak install com.spotify.Client -y


# -+-+-+-+-+- Telegram -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Telegram Desktop -+-+-+-+-+-"
echo "${COLOR_RESET}"

flatpak install org.telegram.desktop -y


# -+=-+=-+=-+=-+=-+=- Finalizando instalações via Flatpak -+=-+=-+=-+=-+=-+=-

echo "${COLOR_RED}"
echo "-+-+-+-+-+-+-+-+-+-+- Checando atualizações -+-+-+-+-+-+-+-+-+-+-"
echo "${COLOR_RESET}"

flatpak update