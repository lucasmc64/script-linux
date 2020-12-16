![Linux Dev WorkStation](./readme-images/capa.svg)

# Script de instalação &#128220;

> Esse script foi feito e testado no *Pop!_OS 20.04* e não há garantias de que funcione em outras distros ou versões desta.

## O que o script faz exatamente? &#129323;

### Programas &#128187;

A seguir está a lista de tudo que será instalado em ordem alfabética de acordo com o "tipo" de instalação.

#### APT

* Audacity
* Blender
* Breeze Cursor
* DarkTable
* Font Manager
* GameHub
* GIMP
* Git
* Gnome Boxes
* Gnome Tweaks
* Google Chrome
* InkScape
* Insomnia
* Kdenlive
* Krita
* KVM
* LibreOffice
* Libs Gráficas
* Lutris
* Node.JS
* OBS Studio
* Opera
* Pastas do Papirus
* Ícones do Papirus
* PostgreSQL
* RawTherapee
* Ruby
* Sqlite
* Steam
* Timeshift
* Unrar
* Vim
* Visual Studio Code
* Vivaldi
* VLC
* ZSH
* Suporte a Flatpak
* Suporte a Snap

#### FLATPAK

* Suporte ao FlatHub
* Anki
* Pixelorama
* Telegram

#### SNAP

* Akira
* AuthPass
* Authy
* Sosumi

#### OUTRO

* Android Studio
* Expo
* Free Download Manager
* Itch
* JDK 8
* Postbird
* RClone
* Yarn

### Configurações &#9881;

Além de adicionar mínimo possível de PPAs (para o SO não quebrar nos updates), o script também configura as variáveis de ambiente do JDK 8 e do Android Studio.

Além disso ele habilita os emojis do Yarn, faz as principais configurações do Git, instala o tema Dracula no Typora e algumas outras coisinhas mais.

> Ainda é necessário abrir o Typora e habilitar o tema Dracula.

## Executando o script &#128163;

### Atenção &#9760;

Esteja ciente de que esse script está com minhas configurações pessoais e pode ser que o script quebre caso algum app não existe nos respositórios padrões ou atualizado.

É interesssante você dar uma olhada no script antes de executá-lo. Há alguns pontos importantes em que você precisa estar atento:

* É de vital impotância que os SDKs do Android Studio sejam baixados no diretório `~/Android/Sdk` já criado durante a instalação. Caso você deseje alterar esse diretório altere o script.
* O script não baixa a versão mais recente do JDK8, mas sim a versão 1.8.0-261. Caso queira a versão mais recente recomendo fazer manualmente a configuração. Recomendo esse tutorial [aqui](https://www.javahelps.com/2015/03/install-oracle-jdk-in-ubuntu.html).
* Como o script não baixa a versão mais recente do JDK 8, é necessário alterar as versões no script conforme a versão nesse servidor extraoficial é atualizada. Caso o script dê erro por não encontrar o JDK 8 no servidor, abra o arquivo *./others/jdk8.sh*, procure pelo número da versão e compare com o que está hospedado no [servidor](http://enos.itcollege.ee/~jpoial/allalaadimised/jdk8). Caso não sejam as mesmas versões basta substituir o número da versão mais nova no script, ele funcionará normalmente.
* Altere as configurações de conta do git para as suas configurações pessoais.
* **O tema Dracula para o Typora só é instalado caso você já tenha aberto o app pela promeira vez** para ele criar as pastas de configurações. Tente abri-lo assim que instalado para tudo correr bem.

### Mão na massa &#129302;

1. Baixe o arquivo *.zip* ou clone esse repositório.
2. Abra o terminal na pasta em que você extraiu ou clonou esse repositório (não dentro da pasta resultante *script-linux*).
3. Execute o comando `sudo chmod -R a+x ./script-linux/` para dar as permissões para a execução do script.
4. Entre na pasta *script-linux* pelo terminal e dê o comando `./install.sh`.

## Minhas configurações manuais e downloads extras &#128406;

### Terminal &#129499;

Como isso envolve uma troca de Shells e reinicialização do computador, não há como fazer via script, mas segue a sequência de comandos para a configuração do terminal.

> Certifique-se de que o ZSH está instalado. Para isso apenas execute no terminal `zsh --version`, se não der erro, prossiga. Agora precisamos trocar o Bash pelo ZSH.

#### ZSH

1. Digite no terminal: `chsh -s $(which zsh)`.
2. Reinicie o computador.
3. Abra o terminal e digite `2`.

#### Oh My ZSH

4. Execute `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`.

#### Tema Dracula no Gnome Terminal

5. Execute `git clone https://github.com/dracula/gnome-terminal`.
6. Execute `cd gnome-terminal`.
7. Execute `./install.sh`.

> Não se esqueça de deletar a pasta depois, ela não será mais necessária.

#### Fira Code

8. Acesse e baixe a versão mais recente do **Fira Code**: `https://github.com/ryanoasis/nerd-fonts/releases/`.
9. Extraia o .zip.
10. Recorte a pasta.
11. Cole a pasta no diretório **~/.fonts**.
12. Acesse as configurações do terminal e defina `FiraCode Nerd Font Retina` como sua fonte.

#### Tema Spaceship

13. Execute: `git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"`.
14. Execute `ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"`.
15. Execute `gedit ~/.zshrc`.
16. Mude o conteúdo do ZSH_THEME para `spaceship`.

#### Exibição do usuário (Spaceship)

17. Feche o terminal e abra-o novamente.
18. No fim do arquivo adicione:

```bash
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "
```

19. Feche o terminal e abra-o novamente.

#### Plugins

20. Execute `sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"`.
21. Execute `gedit ~/.zshrc`.
22. No fim do arquivo adicione:

```bash
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-history-substring-search
zinit light buonomo/yarn-completion
```

#### Comando `ls` colorido

> Certifique-se de ter o Ruby instalado.

23. Execute `sudo gem install colorls`.
24. Abra o arquivo *.zshrc* e adicione a linha `source $(dirname $(gem which colorls))/tab_complete.sh` no final do arquivo.
25. Abra o gerenciador de arquivos entre no diretório *~/.config* e crie uma pasta chamada **colorls**.
26. Execute `cp $(dirname $(gem which colorls))/yaml/dark_colors.yaml ~/.config/colorls/dark_colors.yaml`.
27. Abra o arquivo *~/.config/colorls/dark_colors.yaml* e adicione/substitua as seguintes linhas:

```shell
# Dracula themed dark color settings for colorls
#
# Main Colors
unrecognized_file: '#ffb86c' # Orange
recognized_file:   '#f8f8f2' # Foreground
dir:               '#bd93f9' # Purple

# Link
dead_link: '#ff5555'         # Red
link:      '#8be9fd'         # Cyan

# Special Files
socket:    '#50fa7b'         # Green
blockdev:  '#50fa7b'         # Green
chardev:   '#50fa7b'         # Green

# Access Modes
write:     '#ff79c6'         # Pink
read:      '#bd93f9'         # Purple
exec:      '#8be9fd'         # Cyan
no_access: '#ff5555'         # Red

# Age
hour_old:    '#6272a4'       # Comment
day_old:     '#44475a'       # Current Line
no_modifier: '#f8f8f2'       # Foreground

# File Size
file_large:  '#ff5555'       # Red
file_medium: '#ffb86c'       # Orange
file_small:  '#50fa7b'       # Green

# Random
report: '#50fa7b'            # Green
user:   '#8be9fd'            # Cyan
tree:   '#44475a'            # Current Line
empty:  '#6272a4'            # Comment
error:  '#ff5555'            # Red
normal: '#f8f8f2'            # Foreground

# Git
addition:     '#8be9fd'      # Cyan
modification: '#f1fa8c'      # Yellow
deletion:     '#ff5555'      # Red
untracked:    '#ffb86c'      # Orange
unchanged:    '#50fa7b'      # Green
```

28. Agora abra o arquivo *~/zshrc* e adicione as seguintes linhas no final do arquivo:

```shell
alias ls='colorls -h --group-directories-first -1'
alias l='colorls --group-directories-first --almost-all'
alias ll='colorls --group-directories-first --almost-all --long'
```

### Insomnia &#128299;

1. Abra o Insomnia Core.
2. Clique na aba *Plugins*.
3. Digite `insomnia-plugin-dracula-theme` no campo e clique em *Install plugin*.
4. Agora, na aba *Themes*, clique em *Dracula*.

### Sosumi &#129405;

1. Digitar `sosumi` e esperar que o download se conclua.

### Android Studio &#9879;

1. Rode o Android Studio com o comando *studio.sh* no terminal.
2. Selecione *Custom* na instalação das dependências, avance.
3. Coloque a pasta correta do JDK, avance.
4. Selecione o emulador, avance.
5. Abra as intruções sobre o KVM, finalize.
6. Após finalizarem as instalações obrigatórias clique em *Configure* e, em seguida, *Create Desktop Entry* para o Android Studio aparecer no menu da distro.

### PostgreSQL

1. Execute `ps -ef | grep postgres`
2. Execute `sudo su - postgres`
3. Execute `createuser -EPd lucasmc64` (lucasmc64 é o nome de usuário que escolhi) e dê a senha que desejar
4. Feche o terminal e abra novamente
5. Execute `psql -U lucasmc64 -h127.0.0.1 postgres`
