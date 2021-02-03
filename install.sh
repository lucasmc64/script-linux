#!/bin/bash

# Este script está sendo criado no Pop!_OS 20.04. Possivelmente irá funcionar em outro SO baseado no Ubuntu ou Debian.

# => Variáveis globais

COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`

# => Configurando o ambiente para as instalações

echo "${COLOR_BLUE} => Configurando o ambiente para as instalações ${COLOR_RESET}"

echo "${COLOR_BLUE} ==> Criando pastas necessárias ${COLOR_RESET}"

mkdir -p ~/Android ~/Android/Sdk ~/Dev ~/GoogleDrive ~/Repositories ~/.themes ~/.icons ~/.fonts ~/.config/colorls ~/.vim/pack/themes/opt # ou ~/.vim/pack/themes/start para Vim 8.2 acima

echo "${COLOR_BLUE} ==> Instalando pacotes básicos necessários para prosseguir ${COLOR_RESET}"

sudo apt install wget curl -y

echo "${COLOR_BLUE} ==> Adicionando PPA do Google Chrome ${COLOR_RESET}"

sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list' &&
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 

echo "${COLOR_BLUE} ==> Adicionando PPA do Insomnia Core ${COLOR_RESET}"

echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list &&
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
    | sudo apt-key add - 

echo "${COLOR_BLUE} ==> Adicionando PPA do Node.JS ${COLOR_RESET}"

curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash - 

echo "${COLOR_BLUE} ==> Adicionando PPA do Papirus ${COLOR_RESET}"

sudo add-apt-repository ppa:papirus/papirus -y

echo "${COLOR_BLUE} ==> Adicionando PPA do Typora ${COLOR_RESET}"

wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add - &&
sudo add-apt-repository 'deb https://typora.io/linux ./' -y

echo "${COLOR_BLUE} ==> Adicionando PPA do Visual Studio Code ${COLOR_RESET}"

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg &&
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/ &&
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# => Função de atualização

update () {
    sudo apt clean
    sudo dpkg --configure -a
    sudo apt install -f
    sudo apt update -m &&
    sudo apt upgrade --fix-missing -y
    sudo apt autoclean
    sudo apt autoremove --purge -y
    sudo snap refresh
    sudo npm update -g
    flatpak update -y
    flatpak remove --unused
}

# => APT - Instalações

echo "${COLOR_BLUE} => APT - Instalações ${COLOR_RESET}"

PROGRAMS_APT=(
    android-sdk-platform-tools-common # Dependência do Android Studio
    breeze-cursor-theme # Tema para o cursor
    cpu-checker # Dependência do KVM
    dconf-cli # Dependência para a instalação do tema Dracula para Gnome Terminal
    fakeroot # Lib gráfica
    ffmpeg # Dependencia do OBS Studio e Free Download Manager
    flatpak # Suporte ao flatpak
    folder-color # Alterar cores de pastas na Nautilus
    gcc-multilib # Lib gráfica
    git-man # Documentação do git
    gnome-boxes
    gnome-tweaks
    google-chrome-stable
    insomnia
    lib32z1 # Lib gráfica
    lib32stdc++6 # Lib gráfica
    libreoffice-style-papirus
    libreoffice-style-yaru  # Icones do Yaru para o LibreOffice
    libssl1.1 # Lib gráfica
    nodejs
    obs-studio
    ocl-icd-opencl-dev # Lib gráfica
    papirus-folders
    papirus-icon-theme
    postgresql
    qemu-kvm # Emulação e VMs
    ruby-full # Dependência do ColorLS
    snapd
    sqlite
    sqlite-doc # Documentação
    sqlite3-doc # Documentação
    steam
    typora
    unrar
    vim
    apt-transport-https # Dependencia do VSCode
    code # VSCode
    vlc
    xorriso # Lib gráfica
    zsh
    zsh-doc
)

sudo apt update

for program in ${PROGRAMS_APT[@]}; do
    echo "${COLOR_BLUE} ==> APT - Instalando ${program} ${COLOR_RESET}"

    sudo apt install "$program" -y
done

# => SNAP - Instalações

PROGRAMS_SNAP=(
    authpass,
    authy,
    gtk-common-themes,
    nodemailerapp,
    sosumi
)

for program in ${PROGRAMS_SNAP[@]}; do
    echo "${COLOR_BLUE} ==> SNAP - Instalando ${program} ${COLOR_RESET}"
    
    sudo snap install "$program"
done

# => Flatpak - Instalações

PROGRAMS_FLATPAK=(
    flathub
    net.ankiweb.Anki
    org.gimp.GIMP
    org.inkscape.Inkscape
    org.kde.kdenlive
    org.telegram.desktop
)

for program in ${PROGRAMS_FLATPAK[@]}; do
    echo "${COLOR_BLUE} ==> FLATPAK - Instalando ${program} ${COLOR_RESET}"
    
    flatpak install "$program" -y
done

# Atualizando tudo

update

# => Outros - Instalações

# ==> Android Studio

android_studio () {
    echo "${COLOR_BLUE} => Instalando Android Studio ${COLOR_RESET}"

    url=$(curl -s https://developer.android.com/studio | grep -E "redirector.*linux.tar.gz" | grep -v "Linux" | sed "s/.*href=\"//g;s/\".*//g")
    wget -O android-studio.tar.gz $url
    tar -xvzf ./android-studio.tar.gz
    mv ./android-studio $HOME/AndroidStudio
    rm -rf ./android-studio.tar.gz
    sudo cp /etc/environment /etc/environment.bkp
    PATH_VARIABLE=`grep "PATH=\"*\"" /etc/environment`
    OLD_PATH_CONTENT=`echo ${PATH_VARIABLE:6:${#PATH_VARIABLE}-7}`
    ADD_TO_PATH=`echo ":${HOME}/AndroidStudio/bin"`
    NEW_PATH_CONTENT=`echo ${OLD_PATH_CONTENT}${ADD_TO_PATH}`
    OTHERS_VARIABLES=`grep -v "PATH=\"*\"" /etc/environment`
    sudo rm -f /etc/environment
    echo -e "PATH=\"${NEW_PATH_CONTENT}\"\n${OTHERS_VARIABLES}" | sudo tee -a /etc/environment
}

android_studio

# ==> Expo

expo () {
    echo "${COLOR_BLUE} => Instalando Expo CLI ${COLOR_RESET}"

    sudo npm install --global expo-cli
}

expo

# ==> Free Download Manager

free_download_manager () {
    echo "${COLOR_BLUE} => Instalando Free Download Manager ${COLOR_RESET}"

    wget -O freedownloadmanager.deb https://dn3.freedownloadmanager.org/6/latest/freedownloadmanager.deb
    sudo dpkg -i ./freedownloadmanager.deb
    sudo rm -rf ./freedownloadmanager.deb
    sudo apt --fix-broken install -y
}

free_download_manager

# ==> Itch

itch () {
    echo "${COLOR_BLUE} => Instalando Itch ${COLOR_RESET}"

    wget -O itch-setup https://itch.io/app/download?platform=linux
    chmod +x itch-setup && ./itch-setup
}

itch

# ==> JDK 8

jdk8 () {
    echo "${COLOR_BLUE} => Instalando JDK 8 ${COLOR_RESET}"

    wget -O jdk-8u261-linux-x64.tar.gz http://enos.itcollege.ee/~jpoial/allalaadimised/jdk8/jdk-8u261-linux-x64.tar.gz
    sudo mkdir /usr/lib/jvm
    tar -xvzf ./jdk-8u261-linux-x64.tar.gz
    sudo mv ./jdk1.8.0_261 /usr/lib/jvm
    sudo cp /etc/environment /etc/environment.bkp
    PATH_VARIABLE=`grep "PATH=\"*\"" /etc/environment`
    OLD_PATH_CONTENT=`echo ${PATH_VARIABLE:6:${#PATH_VARIABLE}-7}`
    ADD_TO_PATH=`echo ":/usr/lib/jvm/jdk1.8.0_261/bin:/usr/lib/jvm/jdk1.8.0_261/db/bin:/usr/lib/jvm/jdk1.8.0_261/jre/bin"`
    NEW_PATH_CONTENT=`echo ${OLD_PATH_CONTENT}${ADD_TO_PATH}`
    OTHERS_VARIABLES=`grep -v "PATH=\"*\"" /etc/environment`
    JAVA_VARIABLES=`printf "J2SDKDIR=\"/usr/lib/jvm/jdk1.8.0_261\"\nJ2REDIR=\"/usr/lib/jvm/jdk1.8.0_261/jre\"\nJAVA_HOME=\"/usr/lib/jvm/jdk1.8.0_261\"\nDERBY_HOME=\"/usr/lib/jvm/jdk1.8.0_261/db\"\n"`
    sudo rm -f /etc/environment
    echo -e "PATH=\"${NEW_PATH_CONTENT}\"\n${OTHERS_VARIABLES}\n${JAVA_VARIABLES}" | sudo tee -a /etc/environment
    sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_261/bin/java" 0
    sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0_261/bin/javac" 0
    sudo update-alternatives --set java /usr/lib/jvm/jdk1.8.0_261/bin/java
    sudo update-alternatives --set javac /usr/lib/jvm/jdk1.8.0_261/bin/javac
    update-alternatives --list java
    update-alternatives --list javac
    sudo rm -rf ./jdk-8u261-linux-x64.tar.gz
    java -version

    echo "${COLOR_YELLOW} Caso haja erro nas variáveis de ambiente delete o arquivo /etc/environment e tire o .bkp do arquivo /etc/environment.bkp ${COLOR_RESET}"
}

jdk8

# ==> Postbird

postbird () {
    echo "${COLOR_BLUE} => Instalando Postbird ${COLOR_RESET}"

    url=$(curl -s https://www.electronjs.org/apps/postbird | grep -E ".*postbird.*amd64.*deb" | sed "s/.*href=\"//g;s/\".*//g" | head -n 1)
    wget -O postbird.deb $url
    sudo dpkg -i ./postbird.deb
    sudo apt --fix-broken install -y
    sudo rm -rf ./postbird.deb
}

postbird

# ==> RClone

rclone () {
    echo "${COLOR_BLUE} => Instalando RClone ${COLOR_RESET}"

    wget -O rclone-script.sh https://rclone.org/install.sh
    chmod a+x ./rclone-script.sh
    sudo ./rclone-script.sh
}

rclone

# ==> Yarn

yarn () {
    echo "${COLOR_BLUE} => Instalando Yarn ${COLOR_RESET}"

    sudo npm install -g yarn
}
 
yarn

# => Settings 

# ==> Android Studio

android_studio_settings () {
    echo "${COLOR_GREEN} => Adicionando variáveis de Ambiente do Android Studio ${COLOR_RESET}"

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

# ==> Gdit

gedit_settings () {
    echo "${COLOR_GREEN} => Instalando tema Dracula no Gedit ${COLOR_RESET}"

    wget https://raw.githubusercontent.com/dracula/gedit/master/dracula.xml
    mkdir -p $HOME/.local/share/gedit/styles/
    mv dracula.xml $HOME/.local/share/gedit/styles/
}

gedit_settings

# ==> Git

git_settings () {
    echo "${COLOR_GREEN} => Configurando Git ${COLOR_RESET}"

    git config --global user.name "Lucas Marçal Coutinho"
    git config --global user.email coutinho0604@gmail.com
    git config --global core.editor code
    git config --list
}

git_settings

# ==> KVM

kvm_settings () {
    echo "${COLOR_BLUE} => Configurando KVM ${COLOR_RESET}"

    sudo adduser $USER kvm
}

kvm_settings

# ==> Papirus

papirus_settings () {
    echo "${COLOR_BLUE} => Configurando Papirus ${COLOR_RESET}"

    papirus-folders -C violet --theme Papirus-Dark
}

papirus_settings

# ==> Typora

typora_settings () {
    echo "${COLOR_GREEN} => Instalando tema Dracula no Typora ${COLOR_RESET}"

    typora # O Typora precisa iniciar pela primeira vez para criar as pastas de configurações no sistema. 
    wget -O typora-dracula-theme.zip https://github.com/dracula/typora/archive/master.zip
    unzip typora-dracula-theme.zip
    cd ./typora-master
    cp -r ./d* ~/.config/Typora/themes
    cd ../
    rm -rf typora-dracula-theme.zip
    rm -rf typora-master
    killall -9 Typora # Fecha o Typora

    echo "${COLOR_YELLOW} AVISO: Caso o haja erro, tente abrir o Typora pela primeira vez para ele fazer suas configurações internas iniciais e tente novamente executar essa parte do script. ${COLOR_RESET}"
}

typora_settings

# ==> Vim

vim_settings () {
    echo "${COLOR_GREEN} => Instalando tema Dracula no Vim ${COLOR_RESET}"

    git clone https://github.com/dracula/vim.git dracula
    mv dracula ~/.vim/pack/themes/opt # ou mv ~/.vim/pack/themes/opt para Vim 8.2 acima
    touch ~/.vimrc
    echo -e "packadd! dracula\nsyntax enable\ncolorscheme dracula" | tee -a ~/.vimrc
}

# ==> Yarn

yarn_settings () {
    echo "${COLOR_BLUE} => Habilitando emojis no Yarn ${COLOR_RESET}"

    yarn config set -- --emoji true
}

yarn_settings


# => Baixando e instalando fontes

echo "${COLOR_GREEN} => Baixando e instalando fontes ${COLOR_RESET}"

FONTS=(
    Montserrat,
    Poppins,
    Roboto
)

for font in ${FONTS[@]}; do
    echo "${COLOR_BLUE} ==> Baixando e instalando ${font} ${COLOR_RESET}"
    
    wget -O "$font".zip https://fonts.google.com/download?family="$font"
    unzip "$font".zip -d ./"$font"
    mv ./"$font" ~/.fonts
    rm ./"$font".zip
done

# => Finalizando instalações 

echo "${COLOR_GREEN} => Fim das instalações e configurações ${COLOR_RESET}"