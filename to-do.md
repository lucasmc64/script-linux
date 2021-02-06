* Baixar meus repositórios

echo $(curl \
    -u lucasmc64:$GITHUB_TOKEN_ACCESS \
    -H "Accept: application/vnd.github.v3+json" \
    "https://api.github.com/user/repos?type=owner")

* Não precisar mudar a versão do Java no script;
* Remover instalador do Itch;
* Fechar typora assim que abrir
* Baixar o Fira Code no script
* Adicionar `EDITOR=vim` ao PATH
