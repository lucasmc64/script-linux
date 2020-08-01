# Script de instalação

sudo chmod -R a+x ./re-instalation/

## Motivação

Minha história com Linux tem sido... complicada e cheia de formatações. Gosto de configurar as coisas do meu jeitinho, mas fazer isso várias vezes em um ano se tornou desgastante demais.

## Considerações iniciais

Esse script foi feito e testado no Pop!_OS 20.04. É provável que funcione em qualquer outra distro baseada no Ubuntu 20.04 (e ambiente GNOME quanto aos programas Gnome Boxes e Gnome Tweaks).

## Programas

A seguir está a lista de todos os programas que serão instalados em ordem de instalação.

* (APT) cURL
* (APT) Git
* (APT) Gnome Boxes
* (APT) Gnome Tweaks
* (APT) Google Chrome
* (APT) InkScape
* (APT) Insomnia Core
* (APT) Krita
* (APT) Libs Gráficas
* (APT) Node.JS
* (APT) OBS Studio
* (APT) Python 3
* (APT) Spotify
* (APT) Typora
* (APT) Unrar
* (APT) Vim
* (APT) Visual Studio Code
* (APT) Vivaldi
* (APT) Suporte a Flatpak (caso a distro não tenha)
* (APT) Suporte a Snaps (caso a distro não tenha)
* (SNAP) Blender
* (SNAP) Opera Developer
* (SNAP) Sosumi
* (SNAP) VLC
* (SNAP) Zenkit
* (SNAP) Zenkit To-Do
* (FLATPAK) Suporte ao FlatHub (caso a distro não tenha)
* (FLATPAK) Audacity
* (FLATPAK) Code::Blocks
* (FLATPAK) DarkTable
* (FLATPAK) Discord
* (FLATPAK) Ferdi
* (FLATPAK) GIMP
* (FLATPAK) LibreOffice
* (FLATPAK) NetBeans
* (FLATPAK) RawTherapee
* (FLATPAK) Telegram
* (Script oficial) Joplin
* (WGET) Free Download Manager

### Observações

* O que pude adicionar e instalar de repositórios oficiais eu o fiz.
* Caso queira alterar a ordem de instalação dos programas basta alterar a ordem dos comandos no arquivo do script.
* Caso não queira que um programa não seja instalado basta comentar a(s) linhas referentes a sua instalação colocando `#` no início da linha ou você pode simplesmente deletar as linhas do arquivo.

## Executando o script

1 - Baixe o arquivo *.zip*;
2 - Extraia-o em uma pasta de sua preferência;
3 - Abra o termina na pasta em que você extraiu o *.zip*, não dentro da pasta resultante (*re-instalation*);
4 - Execute o comando `sudo chmod -R a+x ./re-instalation/` para dar as permissões para a execução do script;
5 - Entre na pasta *re-instalation* pelo terminal e dê o comando `sudo ./install.sh`.

## Minhas configurações manuais

### Downloads

#### Piskel

Por ser hospedado no Google Drive é necessário baixar manualmente. Acesse [Piskel](https://www.piskelapp.com/).

#### Davinci Resolve

Por ser necessário login é necessário baixar manualmente. Acesse [Davinci Resolve](https://www.blackmagicdesign.com/br/products/davinciresolve).

### Configurações do Gnome

1 - Abrir as configurações do Gnome.
2 - Na aba *Aparência* importe e defina o papel de parede.
3 - Na aba *Privacidade* selecione *Histórico de arquivos e lixeira* e desmarque a opção **Histórico de arquivos**.
4 - Na aba *Energia* altere o tempo para que a tela se apague para **15min**.
5 - Na aba *Telas* selecione **Luz noturna** e habilite-a.
6 - Na aba *Mouse e Touchpad* desligue a **Rolagem Natural**.
7 - Na aba *Usuários* altere a **foto de perfil**.

### Gnome Tweaks

1 - Abrir Gnome Tweaks.
2 - Na aba *Aparência* altere e instale temas como quiser.
3 - Na aba *Barra superior* habilite **Porcentagem da bateria**, **Dia da semana**, **Números das semanas**.
4 - Na aba *Janelas* habilite **Centralizar novas janelas**.
5 - Na aba *Teclado e mouse* defina o *Perfil de aceleração* do mouse como **Flat**.

### Google Chrome

1 - Abrir o Google Chrome.
2 - Logar com a conta pessoal para a sincronização das informações.

Obs.: Há o tema *Dracula* para o Google Chrome, mas prefiro o tema escuro do SO ou o *Just Black*.

### Joplin

1 - Abrir o Joplin.
2 - Clicar no menu *Ferramentas* e escolher *Opções*.
3 - Na janela que se abre, na aba *Sincronização* defnina qual nuvem o programa usará e o autorize.
4 - Agora, na aba Aparência coloque o tema *Escuro* ou *Dracula*.

### Typora

1 - Abrir o Typora.
2 - Clicar no menu *Temas* e escolher *Dracula*.

### Visual Studio Code

Recomendo a extensão Settings Sync para salvar as configurações.

1 - Abrir o Visual Studio Code.
2 - Instalar a extensão *Settings Sync*.
3 - Autorizar ela a usar o GitHub.
3 - Baixar as configurações (SHIFT + ALT + D).

Obs.: Há o tema *Dracula* para o Visual Studio Code, basta pesquisar na seção de Plugins... Mas prefiro o tema *Horizon*.

### Free Download Manager

1 - Abrir o Free Download Manager.
2 - Clicar no menu hamburguer e escolher *Preferências*.
3 - Mude então para o tema escuro.

### Insomnia Core

1 - Abra o Insomnia Core.
2 - Clique no menu *Aplication* e escolha *Preferences*.
3 - Na janela que se abre, na aba *General*, mude o *Editor Indent Size* para 4.
4 - Clique na aba *Plugins*.
5 - Digite `insomnia-plugin-dracula-theme` no campo e clique em *Install plugin*.
6 - Agora, na aba *Themes*, clique em *Dracula*.

### JetBrains Toolbox

1 - Abra o JetBrains Toolbox.
2 - Instale: Android Studio, PHPStorm, WebSorm, IntelliJ Professional, PyCharm Professional.

#### Android Studio

1 - Adicione nas variáveis de ambiente o seguinte caminho (alterando o número da versão do Android Studio):

`/home/lucasmc64/.local/share/JetBrains/Toolbox/apps/AndroidStudio/ch-0/193.6626763/bin`

> A adição desse caminho possibilita a execução do Android Studio diretamente pelo terminal com o comando studio.sh.

2 - Abra o Android Studio.
3 - Selecione *Custom* na instalação das dependências, avance.
4 - Coloque a pasta correta do JDK, avance.
5 - Selecione o emulador, avance.
6 - Abra as intruções sobre o KVM, finalize.
7 - Após finalizarem as instalações baixe o SDK 28 e o que mais for necessário.
<!--

Ainda instalar:

ZSH - OH MY ZSH - Fira Code
DavinciResolve
Tema no Gnome
Grub - Tema no Grub
Dracula Theme no que puder

-->
