#!/bin/bash


# -+-+-+-+-+- Variáveis -+-+-+-+-+-

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`


# -+-+-+-+-+- Expo -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Expo CLI -+-+-+-+-+-"
echo "${COLOR_RESET}"

sudo npm install --global expo-cli


# -+-+-+-+-+- Free Download Manager -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Free Download Manager -+-+-+-+-+-"
echo "${COLOR_RESET}"

sudo apt install ffmpeg -y
wget -O freedownloadmanager.deb https://dn3.freedownloadmanager.org/6/latest/freedownloadmanager.deb
sudo dpkg -i ./freedownloadmanager.deb
rm -rf ./freedownloadmanager.deb
sudo apt --fix-broken install -y


# -+-+-+-+-+- JDK 8 -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando JDK 8 -+-+-+-+-+-"
echo "${COLOR_RESET}"

wget -O jdk-8u241-linux-x64.tar.gz http://enos.itcollege.ee/~jpoial/allalaadimised/jdk8/jdk-8u241-linux-x64.tar.gz
sudo mkdir /usr/lib/jvm
cd /usr/lib/jvm
sudo tar -xvzf ~/Downloads/jdk-8u241-linux-x64.tar.gz
sudo cp /etc/environment /etc/environment.bkp
PATH_VARIABLE=`grep "PATH=\"*\"" /etc/environment`
OLD_PATH_CONTENT=`echo ${PATH_VARIABLE:6:${#PATH_VARIABLE}-7}`
ADD_TO_PATH=`echo ":/usr/lib/jvm/jdk1.8.0_241/bin:/usr/lib/jvm/jdk1.8.0_241/db/bin:/usr/lib/jvm/jdk1.8.0_241/jre/bin"`
NEW_PATH_CONTENT=`echo ${OLD_PATH_CONTENT}${ADD_TO_PATH}`
OTHERS_VARIABLES=`grep -v "PATH=\"*\"" /etc/environment`
JAVA_VARIABLES=`printf "J2SDKDIR=\"/usr/lib/jvm/jdk1.8.0_241\"\nJ2REDIR=\"/usr/lib/jvm/jdk1.8.0_241/jre\"\nJAVA_HOME=\"/usr/lib/jvm/jdk1.8.0_241\"\nDERBY_HOME=\"/usr/lib/jvm/jdk1.8.0_241/db\"\n"`
sudo printf "PATH=\"${NEW_PATH_CONTENT}\"\n\n${OTHERS_VARIABLES}\n\n${JAVA_VARIABLES}" > /etc/environment
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_241/bin/java" 0
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0_241/bin/javac" 0
sudo update-alternatives --set java /usr/lib/jvm/jdk1.8.0_241/bin/java
sudo update-alternatives --set javac /usr/lib/jvm/jdk1.8.0_241/bin/javac
update-alternatives --list java
update-alternatives --list javac
rm -rf ./jdk-8u241-linux-x64.tar.gz
java -version

echo "${COLOR_RED}"
echo "Caso haja erro nas variáveis de ambiente delete o arquivo /etc/environment e tire o .bkp do arquivo /etc/environment.bkp"
echo "${COLOR_RESET}"


# -+-+-+-+-+- JetBrains ToolBox -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando JetBrains Toolbox -+-+-+-+-+-"
echo "${COLOR_RESET}"

wget -O jetbrains-toolbox-1.17.7275.tar.gz https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.17.7275.tar.gz
tar -xvzf ./jetbrains-toolbox-1.17.7275.tar.gz
./jetbrains-toolbox-1.17.7275/jetbrains-toolbox
rm -rf ./jdk-8u241-linux-x64.tar.gz
rm -rf ./jdk-8u241-linux-x64


# -+-+-+-+-+- Joplin -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Joplin -+-+-+-+-+-"
echo "${COLOR_RESET}"

wget -O - https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash


# -+-+-+-+-+- Postbird -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Postbird -+-+-+-+-+-"
echo "${COLOR_RESET}"

url=$(curl -s https://www.electronjs.org/apps/postbird | grep -E ".*postbird.*amd64.*deb" | sed "s/.*href=\"//g;s/\".*//g" | head -n 1)
wget -O postbird.deb $url
sudo dpkg -i ./postbird.deb
sudo apt --fix-broken install -y
rm -rf ./postbird.deb


# -+-+-+-+-+- Hyper -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Hyper Terminal -+-+-+-+-+-"
echo "${COLOR_RESET}"

wget -O hyper.deb https://releases.hyper.is/download/deb
sudo dpkg -i ./hyper.deb
sudo apt --fix-broken install -y
rm -rf ./hyper.deb


# -+-+-+-+-+- React -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando React -+-+-+-+-+-"
echo "${COLOR_RESET}"

sudo npm install -g create-react-app


# -+-+-+-+-+- Yarn -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando Yarn -+-+-+-+-+-"
echo "${COLOR_RESET}"

sudo npm install -g yarn
yarn -v
yarn config set -- --emoji true