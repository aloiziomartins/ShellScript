#!/bin/bash
#
# git.sh -- Sequencia de passos para  git clone + link e 
# personalização inicial
# 
#Autor: Aloizio Martins
#email: martins.aloizio@gmail.com
#
# Data 05/07/2023 
#       versão: 0.1
#
#Testado pela última vez: 08/07/2023
#   distro Linux: Ubuntu 22.04
#
#Referencia Bibliográfica:
#   SHELL SCRIPT Profissional - Aurelino Marinho Jargasd - novatec
#   stackoverflow.com
#   https://git-scm.com/
#   https://gist.github.com/dasdo/9ff71c5c0efa037441b6
#
#
################################################################

if ! [ -x  "$(command -v git)" ]; then
        echo "git não instalado." >&2
        #TODO# > descobrir distro e executar/instalar git
        exit 1
else
        echo "git instalado."
fi

#criando repositório local
echo "Entre com o link do repositório."
read link
git clone $link

for dirs in ./*; do
    if [ -d "$dirs" ]; then
        echo $(basename "$dirs")
        touch $dirs/.gitignore
    fi
done

git config --global martins.aloizio martins.aloizio@gmail.com
git config --global color.ui true
