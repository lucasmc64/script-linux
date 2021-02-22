![Linux Dev WorkStation](./readme-images/capa.svg)

# Script de instalação :scroll:

> :us: If you prefer to read in another language, this README was also written in english. Click [HERE](/README.md) to access.

Esse script foi feito e testado no *Pop!_OS 20.04* e não há garantias de que funcione em outras distros ou versões desta.

## O que o script faz exatamente? :thinking:

### Programas :technologist:

Seu principal objetivo é automatizar a instalação dos programas que uso no dia a dia seja via APT, Flatpak, Snap ou baixando os arquivos necessários de outras formas.

> Acesse o script para saber quais pacotes são instalados.

### Configurações :gear:

Além de adicionar mínimo possível de PPAs (para o SO não quebrar nos updates), o script também configura as variáveis de ambiente do JDK 8 e do Android Studio.

Além disso ele habilita os emojis do Yarn, faz as principais configurações do Git, instala o tema Dracula no Typora e algumas outras coisinhas mais.

## Executando o script :bomb:

### Atenção :skull_and_crossbones:

Esteja ciente que esse script está com minhas configurações pessoais e pode ser que ele quebre caso algum pacote não exista nos repositórios padrões ou tenha sido atualizado.

É interessante você dar uma olhada no script antes de executá-lo. Há alguns pontos importantes em que você precisa estar atento:

* É de vital importância que os SDKs do Android Studio sejam baixados no diretório `~/Android/Sdk` já criado durante a instalação. Caso você deseje alterar esse diretório altere o script.
* O script não baixa a versão mais recente do JDK8. Caso queira a versão mais recente recomendo fazer manualmente a configuração. Recomendo esse tutorial [aqui](https://www.javahelps.com/2015/03/install-oracle-jdk-in-ubuntu.html).
* Altere as configurações de conta do git para as suas configurações pessoais.

### Chegou a hora :robot:

1. Baixe o arquivo *.zip* ou clone esse repositório.
2. Abra o terminal na pasta que você extraiu do arquivo compactado ou o clone desse repositório.
3. Execute o comando `sudo chmod +x ./install.sh` para dar as permissões para a execução do script.
4. Agora execute o arquivo `./install.sh`.

> Obs.: Perto do fim da execução do script, o Typora será aberto. Isso é necessário para prosseguir com a instalação do tema nele.