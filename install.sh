#!/bin/bash

# Este script está sendo criado no Pop!_OS 20.04. Possivelmente irá funcionar em outro SO baseado no Ubuntu ou Debian.

# => Variáveis globais

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`

DIRECTORY_DOWNLOADS="$HOME/Downloads/Programs"

# => Configurando o ambiente para as instalações

echo "${COLOR_BLUE}"
echo "=> Configurando o ambiente para as instalações"
echo "${COLOR_RESET}"

echo "${COLOR_BLUE}"
echo "==> Criando pastas para o SDK do Android"
echo "${COLOR_RESET}"

mkdir ~/Android
mkdir ~/Android/Sdk

echo "${COLOR_BLUE}"
echo "==> Instalando pacotes básicos necessários para prosseguir"
echo "${COLOR_RESET}"

sudo apt install wget curl -y

echo "${COLOR_BLUE}"
echo "==> Adicionando PPA do Google Chrome"
echo "${COLOR_RESET}"

sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list' &&
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 

echo "${COLOR_BLUE}"
echo "==> Adicionando PPA do Insomnia Core"
echo "${COLOR_RESET}"

echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list &&
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
    | sudo apt-key add - 

echo "${COLOR_BLUE}"
echo "==> Adicionando PPA do Node"
echo "${COLOR_RESET}"

curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash - 

echo "${COLOR_BLUE}"
echo "==> Adicionando PPA do Opera"
echo "${COLOR_RESET}"

wget -O - http://deb.opera.com/archive.key | sudo apt-key add - &&
sudo sh -c 'echo "deb http://deb.opera.com/opera-stable/ stable non-free" >> /etc/apt/sources.list.d/opera-stable.list'

echo "${COLOR_BLUE}"
echo "==> Adicionando PPA do Typora"
echo "${COLOR_RESET}"

wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add - &&
sudo add-apt-repository 'deb https://typora.io/linux ./' -y

echo "${COLOR_BLUE}"
echo "==> Adicionando PPA do Visual Studio Code"
echo "${COLOR_RESET}"

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg &&
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/ &&
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

echo "${COLOR_BLUE}"
echo "==> Adicionando PPA do Vivaldi"
echo "${COLOR_RESET}"

wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add - &&
sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main' -y

# => Função de atualização

update () {
    sudo apt clean
    sudo dpkg --configure -a
    sudo apt install -f
    sudo apt dist-upgrade --fix-missing -y
    sudo apt update -m &&
    sudo apt upgrade --fix-missing -y
    sudo apt autoclean
    sudo apt autoremove --purge -y
    sudo snap refresh;
    sudo npm update -g; 
    flatpak update -y
}

# => APT - Instalações

echo "${COLOR_BLUE}"
echo "=> APT - Instalações"
echo "${COLOR_RESET}"

PROGRAMS_APT = (
    audacity
    blender
    breeze-cursor-theme # Tema para o cursor
    cpu-checker # Dependência do KVM
    darktable
    dconf-cli # Dependência para a instalação do tema Dracula para Gnome Terminal
    discord
    fakeroot # Lib gráfica
    ffmpeg # Dependencia do OBS Studio e Free Download Manager
    flatpak
    gcc-multilib # Lib gráfica
    gimp
    git
    git-man # Documentação do git
    gnome-boxes
    gnome-tweaks
    google-chrome-stable
    inkscape
    insomnia
    kdenlive
    krita
    krita-l10n # Dependência do Krita
    lib32z1 # Lib gráfica
    lib32stdc++6 # Lib gráfica
    libreoffice
    libreoffice-style-yaru  # Icones do Yaru para o LibreOffice
    libssl1.1 # Lib gráfica
    lutris
    nodejs
    obs-studio
    ocl-icd-opencl-dev # Lib gráfica
    opera-stable
    postgresql
    python3
    qemu-kvm
    ruby-full
    snapd
    sqlite
    sqlite-doc # Documentação
    sqlite3-doc # Documentação
    steam
    timeshift
    typora
    unrar
    vim
    apt-transport-https # Dependencia do VSCode
    code # ou code-insiders -y
    vivaldi-stable
    vlc
    xorriso # Lib gráfica
    zsh
    zsh-doc
)

update

for program in ${PROGRAMS_APT[@]}; do
    if ! dpkg -l | grep -q $program; then # Só instala se já não estiver instalado
        echo "${COLOR_BLUE}"
        echo "==> APT - Instalando ${program}"
        echo "${COLOR_RESET}"
        sudo apt install "$program" -y
    else
        echo "[INSTALADO] - $program"
    fi
done

update

# => APT - Pós-instalações

echo "${COLOR_BLUE}"

echo "==> KVM"
egrep -c '(vmx|svm)' /proc/cpuinfo
kvm-ok

echo "==> Node"
node -v

echo "==> Npm"
npm -v

echo "==> Python"
python3 --version

echo "==> Ruby"
ruby --version

echo "${COLOR_RESET}"

# => SNAP - Instalações

PROGRAMS_SNAP = (
    sosumi
)

update

for program in ${PROGRAMS_SNAP[@]}; do
    if ! snap list | grep -q $program; then # Só instala se já não estiver instalado
        echo "${COLOR_BLUE}"
        echo "==> SNAP - Instalando ${program}"
        echo "${COLOR_RESET}"
        sudo snap install "$program"
    else
        echo "[INSTALADO] - $program"
    fi
done

update

# => Flatpak - Instalações

PROGRAMS_FLATPAK = (
    flathub
    com.github.johnfactotum.Foliate
    com.orama_interactive.Pixelorama
    com.rawtherapee.RawTherapee
    org.telegram.desktop
)

update

for program in ${PROGRAMS_SNAP[@]}; do
    if ! flatpak list | grep -q $program; then # Só instala se já não estiver instalado
        echo "${COLOR_BLUE}"
        echo "==> FLATPAK - Instalando ${program}"
        echo "${COLOR_RESET}"
        flatpak install "$program" -y
    else
        echo "[INSTALADO] - $program"
    fi
done

update

# => Outros - Instalações

# ==> Android Studio

android_studio () {
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
}

sudo android_studio

# ==> Expo

expo () {
    echo "${COLOR_BLUE}"
    echo "=> Instalando Expo CLI"
    echo "${COLOR_RESET}"

    sudo npm install --global expo-cli
}

sudo expo

# ==> Free Download Manager

free_download_manager () {
    echo "${COLOR_BLUE}"
    echo "=> Instalando Free Download Manager"
    echo "${COLOR_RESET}"

    wget -O freedownloadmanager.deb https://dn3.freedownloadmanager.org/6/latest/freedownloadmanager.deb
    sudo dpkg -i ./freedownloadmanager.deb
    sudo rm -rf ./freedownloadmanager.deb
    sudo apt --fix-broken install -y
}

sudo free_download_manager

# ==> Itch

itch () {
    echo "${COLOR_BLUE}"
    echo "=> Instalando Itch"
    echo "${COLOR_RESET}"

    wget -O itch-setup https://itch.io/app/download?platform=linux
    chmod +x itch-setup && ./itch-setup
}

sudo itch

# ==> JDK 8

jdk8 () {
    echo "${COLOR_BLUE}"
    echo "=> Instalando JDK 8"
    echo "${COLOR_RESET}"

    wget -O jdk-8u261-linux-x64.tar.gz http://enos.itcollege.ee/~jpoial/allalaadimised/jdk8/jdk-8u261-linux-x64.tar.gz
    sudo mkdir /usr/lib/jvm
    sudo tar -xvzf ./jdk-8u261-linux-x64.tar.gz
    mv ./jdk1.8.0_261 /usr/lib/jvm
    sudo cp /etc/environment /etc/environment.bkp
    PATH_VARIABLE=`grep "PATH=\"*\"" /etc/environment`
    OLD_PATH_CONTENT=`echo ${PATH_VARIABLE:6:${#PATH_VARIABLE}-7}`
    ADD_TO_PATH=`echo ":/usr/lib/jvm/jdk1.8.0_261/bin:/usr/lib/jvm/jdk1.8.0_261/db/bin:/usr/lib/jvm/jdk1.8.0_261/jre/bin"`
    NEW_PATH_CONTENT=`echo ${OLD_PATH_CONTENT}${ADD_TO_PATH}`
    OTHERS_VARIABLES=`grep -v "PATH=\"*\"" /etc/environment`
    JAVA_VARIABLES=`printf "J2SDKDIR=\"/usr/lib/jvm/jdk1.8.0_261\"\nJ2REDIR=\"/usr/lib/jvm/jdk1.8.0_261/jre\"\nJAVA_HOME=\"/usr/lib/jvm/jdk1.8.0_261\"\nDERBY_HOME=\"/usr/lib/jvm/jdk1.8.0_261/db\"\n"`
    sudo printf "PATH=\"${NEW_PATH_CONTENT}\"\n\n${OTHERS_VARIABLES}\n\n${JAVA_VARIABLES}" > /etc/environment
    sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_261/bin/java" 0
    sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0_261/bin/javac" 0
    sudo update-alternatives --set java /usr/lib/jvm/jdk1.8.0_261/bin/java
    sudo update-alternatives --set javac /usr/lib/jvm/jdk1.8.0_261/bin/javac
    update-alternatives --list java
    update-alternatives --list javac
    sudo rm -rf ./jdk-8u261-linux-x64.tar.gz
    java -version

    echo "${COLOR_RED}"
    echo "Caso haja erro nas variáveis de ambiente delete o arquivo /etc/environment e tire o .bkp do arquivo /etc/environment.bkp"
    echo "${COLOR_RESET}"
}

sudo jdk8

# ==> Postbird

postbird () {
    echo "${COLOR_BLUE}"
    echo "=> Instalando Postbird"
    echo "${COLOR_RESET}"

    url=$(curl -s https://www.electronjs.org/apps/postbird | grep -E ".*postbird.*amd64.*deb" | sed "s/.*href=\"//g;s/\".*//g" | head -n 1)
    wget -O postbird.deb $url
    sudo dpkg -i ./postbird.deb
    sudo apt --fix-broken install -y
    sudo rm -rf ./postbird.deb
}

sudo postbird

# ==> RClone

rclone () {
    echo "${COLOR_BLUE}"
    echo "=> Instalando RClone"
    echo "${COLOR_RESET}"

    wget -O rclone-script.sh https://rclone.org/install.sh
    chmod a+x ./rclone-script.sh
    ./rclone-script.sh
}

sudo rclone

# ==> Yarn

yarn () {
    echo "${COLOR_BLUE}"
    echo "=> Instalando Yarn"
    echo "${COLOR_RESET}"

    sudo npm install -g yarn
}

sudo yarn

# => Outros - Pós-instalações

echo "${COLOR_BLUE}"

echo "==> Yarn"

yarn -v

echo "${COLOR_RESET}"

# => Settings 

# ==> Android Studio

android_studio_settings () {
    echo "${COLOR_GREEN}"
    echo "=> Adicionando variáveis de Ambiente do Android Studio"
    echo "${COLOR_RESET}"

    CURRENT_USER="lucasmc64"
    PATH_VARIABLE=`grep "PATH=\"*\"" /etc/environment`
    OLD_PATH_CONTENT=`echo ${PATH_VARIABLE:6:${#PATH_VARIABLE}-7}`
    ADD_TO_PATH=`echo ":/home/${CURRENT_USER}/Android/Sdk/emulator:/home/${CURRENT_USER}/Android/Sdk/tools:/home/${CURRENT_USER}/Android/Sdk/tools/bin:/home/${CURRENT_USER}/Android/Sdk/platform-tools"`
    NEW_PATH_CONTENT=`echo ${OLD_PATH_CONTENT}${ADD_TO_PATH}`
    OTHERS_VARIABLES=`grep -v "PATH=\"*\"" /etc/environment`
    ANDROID_VARIABLES=`printf "ANDROID_HOME=\"/home/${CURRENT_USER}/Android/Sdk\"\n"`
    sudo printf "PATH=\"${NEW_PATH_CONTENT}\"\n\n${OTHERS_VARIABLES}\n\n${ANDROID_VARIABLES}" > /etc/environment
}

sudo android_studio_settings

# ==> Git

git_settings () {
    echo "${COLOR_GREEN}"
    echo "=> Configurando Git"
    echo "${COLOR_RESET}"

    git config --global user.name "Lucas Marçal Coutinho"
    git config --global user.email coutinho0604@gmail.com
    git config --global core.editor code
    git config --list
}

git_settings

# ==> KVM

kvm_settings () {
    echo "${COLOR_BLUE}"
    echo "=> Configurando KVM"
    echo "${COLOR_RESET}"

    sudo adduser $USER kvm
}

sudo kvm_settings

# ==> Typora

typora_settings () {
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
}

typora_settings

# ==> Yarn

yarn_settings () {
    echo "${COLOR_BLUE}"
    echo "=> Habilitando emojis no Yarn"
    echo "${COLOR_RESET}"

    yarn config set -- --emoji true
}

yarn_settings

# => Finalizando instalações 

echo "${COLOR_GREEN}"
echo "=> Finalizando instalações"
echo "=> Leia o README para terminar"
echo "${COLOR_RESET}"
