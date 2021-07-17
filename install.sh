#!/bin/bash

# This script will work on Ubuntu, Debian and Fedora distros with GNOME Shell.

BOLD="\e[1m"
FAINT="\e[2m"
ITALIC="\e[3m"
UNDERLINE="\e[4m"

BLACK="\e[30m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
LIGHT_GRAY="\e[37m"
GRAY="\e[90m"
LIGHT_RED="\e[91m"
LIGHT_GREEN="\e[92m"
LIGHT_YELLOW="\e[93m"
LIGHT_BLUE="\e[94m"
LIGHT_MAGENTA="\e[95m"
LIGHT_CYAN="\e[96m"
WHITE="\e[97m"

RESET="\e[0m"

DISTRO=$(cat /etc/*-release | grep "^ID=" | sed "s/.*ID=//g")
PACKAGE_MANAGER=""
INSTALL_COMMAND=""
FLAGS=""

echo -e "${BLUE}# Creating folders${RESET}"

mkdir -p ~/Android ~/Android/Sdk ~/Classes ~/Dev ~/GoogleDrive ~/Repositories ~/RetroGames ~/.themes ~/.icons ~/.fonts ~/.config/colorls ~/.vim/pack/themes/opt # ou ~/.vim/pack/themes/start para Vim 8.2 acima

echo -e "${BLUE}# Configuring environment${RESET}"

if [[ $DISTRO -eq debian ]] 
then
    sudo apt purge gnome-games -y
fi

sudo $PACKAGE_MANAGER $INSTALL_COMMAND wget curl $FLAGS

case $DISTRO in
    debian | ubuntu | pop)
        # Debian family

        PACKAGE_MANAGER="apt"
        INSTALL_COMMAND="install"
        FLAGS="-y"

        # Adding GitHub CLI Repository

        curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

        # Adding Google Chrome Repository

        sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list' &&
        wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 

        case $DISTRO in
            debian)
                # Adding Node.JS Repository

                sudo curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo bash -
            ;;
            ubuntu | pop)
                # Adding Node.JS Repository

                curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
            ;;
        esac

        sudo apt update
    ;;
    fedora)
        # Fedora
        
        PACKAGE_MANAGER="dnf"
        INSTALL_COMMAND="install"
        FLAGS="-y"

        # Adding extra repositories

        sudo dnf install fedora-workstation-repositories -y

        # Enabling Google Chrome repository

        sudo dnf config-manager --set-enabled google-chrome

        # Adding GitHub CLI Repository

        sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo

        # Adding Node.JS Repository

        curl -fsSL https://rpm.nodesource.com/setup_lts.x | sudo bash -
    ;;
    manjaro)
        # Manjaro

        PACKAGE_MANAGER="pacman"
        FLAGS="-S"
    ;;
    *)
        echo "Unknown Distro: Unable to perform proper operations."
        exit 1
    ;;
esac

echo -e "${BLUE}# Installing packages${RESET}"

COMMON_PACKAGES=(
    flatpak # Flatpak support
    gnome-boxes
    gnome-tweaks
    jq # Format JSON to display in terminal
    nodejs # NPM is included
    pandoc # Allow Typora to work with other file extensions
    postgresql
    shellcheck # Search for errors in shellscripts
    snapd # Snaps support
    sqlite # CONFERIR NO MANJARO
    vim
    zsh # CONFERIR NO MANJARO
)

APT_PACKAGES=(
    breeze-cursor-theme # Cursor theme
    dconf-cli # Dracula Theme in Gnome Terminal instalation dependency
    dirmngr # GitHub CLI dependecy
    ffmpeg # Free Download Manager dependecy
    gh # GitHub CLI
    google-chrome-stable
    qemu-kvm # Emulation and VMs
    ruby-full # ColorLS dependency
    spice-client-gtk # Sharing folders and resources with VMs dependecy
)

DNF_PACKAGES=(
    breeze-cursor-theme # Cursor theme
    dconf # Dependency to install Dracula Theme in Gnome Terminal
    gh # GitHub CLI
    google-chrome-stable
    qemu-kvm # Emulation and VMs
    ruby # ColorLS dependency
    spice-gtk # Sharing folders and resources with VMs dependecy
)

PACMAN_PACKAGES=(
    dconf # Dependency to install Dracula Theme in Gnome Terminal
    github-cli # GitHub CLI
    qemu # Emulation and VMs
    ruby # ColorLS dependency
    spice-gtk # Sharing folders and resources with VMs dependecy
    xcursor-breeze # Cursor theme
    # HASN'T CHROME
)

ALL_PACKAGES=()

case $DISTRO in
    debian | ubuntu | pop)
        ALL_PACKAGES=(COMMON_PACKAGES APT_PACKAGES)
    ;;
    fedora)
        ALL_PACKAGES=(COMMON_PACKAGES DNF_PACKAGES)
    ;;
    manjaro)
        ALL_PACKAGES=(COMMON_PACKAGES PAMAC_PACKAGES)
    ;;
esac

for program in ${ALL_PACKAGES[@]}; do
    echo -e "${BLUE}# Installing ${program}${RESET}"

    sudo ${PACKAGE_MANAGER} ${INSTALL_COMMAND} "$program" ${FLAGS}
done

# Installing Papirus Icon Theme

wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.icons" sh

# Installing Papirus Folders

wget -qO- https://git.io/papirus-folders-install | sh

SNAP_PACKAGES=(
    authpass
    gtk-common-themes
    mailspring
    nodemailerapp
    sosumi
    spotifyd
    spt
)

for program in ${SNAP_PACKAGES[@]}; do
    echo -e "${BLUE}# Installing ${program}${RESET}"
    
    sudo snap install "$program"
done

echo -e "${BLUE}# Installing authy${RESET}"
sudo snap install authy --beta

snap connect authpass:password-manager-service

FLATPAK_PAKAGES=(
    flathub
    com.google.AndroidStudio
    com.obsproject.Studio
    com.valvesoftware.Steam
    com.visualstudio.code
    net.ankiweb.Anki
    org.gimp.GIMP
    org.gnome.Boxes
    org.gtk.Gtk3theme.Adwaita-dark
    org.inkscape.Inkscape
    org.kde.kdenlive
    org.libretro.RetroArch
    org.mozilla.firefox
    org.telegram.desktopio.typora.Typora
    org.videolan.VLC
    rest.insomnia.Insomnia
)

for program in ${PROGRAMS_FLATPAK[@]}; do
    echo -e "${BLUE}#Installing ${program}${RESET}"
    
    flatpak install "$program" -y
done

update () {
    case $DISTRO in
        debian | ubuntu | pop)
            sudo apt clean
            sudo dpkg --configure -a
            sudo apt install -f
            sudo apt update -m &&
            sudo apt upgrade --fix-missing --allow-downgrades -y
            sudo apt autoclean
            sudo apt autoremove --purge -y
        ;;
        fedora)
            sudo dnf clean
            sudo dnf check-update
            sudo dnf distro-sync
            sudo dnf upgrade
            sudo dnf autoremove
        ;;
        manjaro)
        ;;
    esac
    sudo snap refresh
    sudo npm update -g
    flatpak update -y
    flatpak remove --unused
}

update

expo () {
    echo -e "${BLUE}# Installing Expo CLI ${RESET}"

    sudo npm install --global expo-cli
}

expo

: '
## Free Download Manager

free_download_manager () {
    echo -e "${BLUE}# Installing Free Download Manager ${RESET}"

    wget -O freedownloadmanager.deb https://dn3.freedownloadmanager.org/6/latest/freedownloadmanager.deb
    sudo dpkg -i ./freedownloadmanager.deb
    sudo rm -rf ./freedownloadmanager.deb
    sudo apt --fix-broken install -y
}

free_download_manager

## Itch

itch () {
    echo -e "${BLUE}# Installing Itch ${RESET}"

    wget -O itch-setup https://itch.io/app/download?platform=linux
    chmod +x itch-setup && ./itch-setup
}

itch

## JDK 8

jdk8 () {
    echo -e "${BLUE}# Installing JDK 8 ${RESET}"

    JAVA_SUBVERSION=$(curl -s https://enos.itcollege.ee/~jpoial/allalaadimised/jdk8/ | grep -E "*linux-x64.tar.gz" | sed "s/.*href=\"jdk-8u//g;s/-linux-x64.tar.gz\".*//g")
    wget -O jdk-8u${JAVA_SUBVERSION}-linux-x64.tar.gz http://enos.itcollege.ee/~jpoial/allalaadimised/jdk8/jdk-8u${JAVA_SUBVERSION}-linux-x64.tar.gz
    sudo mkdir /usr/lib/jvm
    tar -xvzf ./jdk-8u${JAVA_SUBVERSION}-linux-x64.tar.gz
    sudo mv ./jdk1.8.0_${JAVA_SUBVERSION} /usr/lib/jvm
    sudo cp /etc/environment /etc/environment.bkp
    PATH_VARIABLE=`grep "PATH=\"*\"" /etc/environment`
    OLD_PATH_CONTENT=`echo ${PATH_VARIABLE:6:${#PATH_VARIABLE}-7}`
    ADD_TO_PATH=`echo ":/usr/lib/jvm/jdk1.8.0_${JAVA_SUBVERSION}/bin:/usr/lib/jvm/jdk1.8.0_${JAVA_SUBVERSION}/db/bin:/usr/lib/jvm/jdk1.8.0_${JAVA_SUBVERSION}/jre/bin"`
    NEW_PATH_CONTENT=`echo ${OLD_PATH_CONTENT}${ADD_TO_PATH}`
    OTHERS_VARIABLES=`grep -v "PATH=\"*\"" /etc/environment`
    JAVA_VARIABLES=`printf "J2SDKDIR=\"/usr/lib/jvm/jdk1.8.0_${JAVA_SUBVERSION}\"\nJ2REDIR=\"/usr/lib/jvm/jdk1.8.0_${JAVA_SUBVERSION}/jre\"\nJAVA_HOME=\"/usr/lib/jvm/jdk1.8.0_${JAVA_SUBVERSION}\"\nDERBY_HOME=\"/usr/lib/jvm/jdk1.8.0_${JAVA_SUBVERSION}/db\"\n"`
    sudo rm -f /etc/environment
    echo -e "PATH=\"${NEW_PATH_CONTENT}\"\n${OTHERS_VARIABLES}\n${JAVA_VARIABLES}" | sudo tee -a /etc/environment
    sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_${JAVA_SUBVERSION}/bin/java" 0
    sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0_${JAVA_SUBVERSION}/bin/javac" 0
    sudo update-alternatives --set java /usr/lib/jvm/jdk1.8.0_${JAVA_SUBVERSION}/bin/java
    sudo update-alternatives --set javac /usr/lib/jvm/jdk1.8.0_${JAVA_SUBVERSION}/bin/javac
    update-alternatives --list java
    update-alternatives --list javac
    sudo rm -rf ./jdk-8u${JAVA_SUBVERSION}-linux-x64.tar.gz
    java -version

    echo -e "${YELLOW} Caso haja erro nas variáveis de ambiente delete o arquivo /etc/environment e tire o .bkp do arquivo /etc/environment.bkp ${RESET}"
}

jdk8

## Live Server

live_server () {
    echo -e "${BLUE}# Installing Live Server ${RESET}"

    sudo npm install -g live-server
}
 
live_server

## Postbird

postbird () {
    echo -e "${BLUE}# Installing Postbird ${RESET}"

    url=$(curl -s https://www.electronjs.org/apps/postbird | grep -E ".*postbird.*amd64.*deb" | sed "s/.*href=\"//g;s/\".*//g" | head -n 1)
    wget -O postbird.deb $url
    sudo dpkg -i ./postbird.deb
    sudo apt --fix-broken install -y
    sudo rm -rf ./postbird.deb
}

postbird

## RClone

rclone () {
    echo -e "${BLUE}# Installing RClone ${RESET}"

    wget -O rclone-script.sh https://rclone.org/install.sh
    chmod a+x ./rclone-script.sh
    sudo ./rclone-script.sh
}

rclone

## Vercel CLI

vercel_cli () {
    echo -e "${BLUE}# Installing Vercel CLI ${RESET}"

    sudo npm install -g vercel
}
 
vercel_cli

## Yarn

yarn () {
    echo -e "${BLUE}# Installing Yarn ${RESET}"

    sudo npm install -g yarn
}
 
yarn

## Settings 

## Android Studio

android_studio_settings () {
    echo -e "${GREEN}# Adicionando variáveis de Ambiente do Android Studio ${RESET}"

    sudo cp /etc/environment /etc/environment.bkp
    PATH_VARIABLE=`grep "PATH=\"*\"" /etc/environment`
    OLD_PATH_CONTENT=`echo ${PATH_VARIABLE:6:${#PATH_VARIABLE}-7}`
    ADD_TO_PATH=`echo ":/home/$USER/Android/Sdk/emulator:/home/$USER/Android/Sdk/tools:/home/$USER/Android/Sdk/tools/bin:/home/$USER/Android/Sdk/platform-tools"`
    NEW_PATH_CONTENT=`echo ${OLD_PATH_CONTENT}${ADD_TO_PATH}`
    OTHERS_VARIABLES=`grep -v "PATH=\"*\"" /etc/environment`
    ANDROID_VARIABLES=`printf "ANDROID_HOME=\"/home/$USER/Android/Sdk\"\n"`
    sudo rm -f /etc/environment
    echo -e "PATH=\"${NEW_PATH_CONTENT}\"\n${OTHERS_VARIABLES}\n${ANDROID_VARIABLES}" | sudo tee -a /etc/environment
    sudo usermod -aG plugdev $LOGNAME # Adiciona meu usuário ao plugdev
}

android_studio_settings

## Gdit

gedit_settings () {
    echo -e "${GREEN}# Installing tema Dracula no Gedit ${RESET}"

    wget https://raw.githubusercontent.com/dracula/gedit/master/dracula.xml
    mkdir -p $HOME/.local/share/gedit/styles/
    mv dracula.xml $HOME/.local/share/gedit/styles/
}

gedit_settings

## Git

git_settings () {
    echo -e "${GREEN}# Configurando Git ${RESET}"

    git config --global user.name "Lucas Marçal Coutinho"
    git config --global user.email coutinho0604@gmail.com
    git config --global core.editor code
    git config --list
}

git_settings

## KVM

kvm_settings () {
    echo -e "${BLUE}# Configurando KVM ${RESET}"

    sudo adduser $USER kvm
}

kvm_settings

## Papirus

papirus_settings () {
    echo -e "${BLUE}# Configurando Papirus ${RESET}"

    papirus-folders -C violet --theme Papirus-Dark
}

papirus_settings

## Typora

typora_settings () {
    echo -e "${GREEN}# Installing tema Dracula no Typora ${RESET}"

    typora
    wget -O typora-dracula-theme.zip https://github.com/dracula/typora/archive/master.zip
    unzip typora-dracula-theme.zip
    cd ./typora-master
    cp -r ./d* ~/.config/Typora/themes
    cd ../
    rm -rf typora-dracula-theme.zip
    rm -rf typora-master

    echo -e "${YELLOW} AVISO: Caso o haja erro, tente abrir o Typora pela primeira vez para ele fazer suas configurações internas iniciais e tente novamente executar essa parte do script. ${RESET}"
}

typora_settings

## Vim

vim_settings () {
    echo -e "${GREEN}# Installing tema Dracula no Vim ${RESET}"

    git clone https://github.com/dracula/vim.git dracula
    mv dracula ~/.vim/pack/themes/opt # ou mv ~/.vim/pack/themes/opt para Vim 8.2 acima
    touch ~/.vimrc
    echo -e "packadd! dracula\nsyntax enable\ncolorscheme dracula" | tee -a ~/.vimrc
}

vim_settings

## Yarn

yarn_settings () {
    echo -e "${BLUE}# Habilitando emojis no Yarn ${RESET}"

    yarn config set -- --emoji true
    sudo cp /etc/environment /etc/environment.bkp
    PATH_VARIABLE=`grep "PATH=\"*\"" /etc/environment`
    OLD_PATH_CONTENT=`echo ${PATH_VARIABLE:6:${#PATH_VARIABLE}-7}`
    ADD_TO_PATH=`echo ":$(yarn global bin)"`
    NEW_PATH_CONTENT=`echo ${OLD_PATH_CONTENT}${ADD_TO_PATH}`
    OTHERS_VARIABLES=`grep -v "PATH=\"*\"" /etc/environment`
    sudo rm -f /etc/environment
    echo -e "PATH=\"${NEW_PATH_CONTENT}\"\n${OTHERS_VARIABLES}" | sudo tee -a /etc/environment
}

yarn_settings

'

FONTS=(
    Montserrat
    Poppins
    Roboto
)

for font in ${FONTS[@]}; do
    echo -e "${BLUE}# Downloading and installing ${font} font${RESET}"
    
    wget -O "$font".zip https://fonts.google.com/download?family="$font"
    unzip "$font".zip -d ./"$font"
    mv ./"$font" ~/.fonts
    rm ./"$font".zip
done

REPOSITORIES=($(curl \
    -u lucasmc64:$GITHUB_TOKEN_ACCESS \
    -H "Accept: application/vnd.github.v3+json" \
    "https://api.github.com/user/repos?type=owner" \
    | sed "s/.*\"full_name\": \"//g;s/\".*//g" | sed "s/[\[\{\}\,]//g;s/\]//g;s/lucasmc64\///g"))

for repository in ${REPOSITORIES[@]}; do
    echo -e "${BLUE}# Cloning repository ${repository}${RESET}"

    git clone https://lucasmc64:"$GITHUB_TOKEN_ACCESS"@github.com/lucasmc64/"$repository".git ~/Repositories/"$repository"

    echo -e "\n"
done

echo -e "${GREEN}# End of installations${RESET}"