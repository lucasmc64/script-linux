#!/bin/bash


# -+-+-+-+-+- Variáveis -+-+-+-+-+-

COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
COLOR_YELLOW=`tput setaf 3`
COLOR_BLUE=`tput setaf 4`
COLOR_RESET=`tput sgr0`


# -+-+-+-+-+- JDK 8 -+-+-+-+-+-

echo "${COLOR_BLUE}"
echo "-+-+-+-+-+- Instalando JDK 8 -+-+-+-+-+-"
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
