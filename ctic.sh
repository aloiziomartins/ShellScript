#!/bin/bash
# Proxima versão será com "case" e funções.
# Optei em fazer comando e lista de comandos, um menu com todas as opções cadastradas
# poderia gerar um menu muito extenso.
INFO="
    #Arquivo shell para automatizar comandos e acessos mais utilizados na CTIC.
    #Para facilitar recomenda-se adicionar o arquivo ctic.sh ao PATH da distribuição
    #
    # Parte 1:
    #   Adicionar:
    #        Para aicionar um comando ou script, rode o scripsat: ./ctic.sh <Nome_do_comando> abrirá 
    #        o terminal Nano para escrever os comandos que precisam ser executados, neste arquivo não é necessário
    #        informar a shebang #!/bin/bash. Após escrever seus script basta salvar e esta pronto.
    #        Ao Adicionar um comando será criado um arquivo na pasta 'comandos' com o nome do comando
    #        com a extensão .sh, também será feito um chmod +x no arquivo.
    #   Se a adiçao foi feita corretamente e o comando estiver correto para usar o comando pasta 
    #   usar o comando './ctic.sh <Nome_do_Comando>'.
    # 
    #Parte 2:
    #   Listar:
    #       Para listar comandos e scripts já cadastrados basta digitar: ./ctic listar
    #
    #Parte 2:
    #   Editar:
    #       Objetivo é abrir para edição/correção de comando ou script. Também é possível editar
    #       o arquivo gerado na pasta comandos. comando para editar: ./ctic.sh editar <Nome_do_Comando>
    #
    #Parte 3: 
    #   Excluir:
    #   Para excluir comando: ctic remover <Nome_do_Comando>                
    #
    #IFSC - Instituto Fedral de Santa Catarina
    #CTIC - Coordenadoreia de Tecnologia e Informação e Comunicação
    #
    #Aloizio Martins 19/09/2023
    "
if [ "$1" == "-h" ]; then
    echo "$INFO"
    exit 0
fi

# Diretório para armazenar os comandos personalizados
diretorio_comandos="$HOME/Documentos/ctic/comandos"
mkdir -p "$diretorio_comandos" # Cria diretório se não existir

# Adicionar um novo comando personalizado
if [ "$1" == "adicionar" ]; then
    if [ -z "$2" ] || [ -z "$3" ]; then
        touch $diretorio_comandos/"$2.sh" && nano $diretorio_comandos/"$2.sh"
        file_comando=$diretorio_comandos/"$2.sh"
        if test -f $file_comando; then
            echo "Comando e Arquivo foi cadastrado"
            chmod +x $diretorio_comandos/"$2.sh"
            exit 0
        else
            echo "Errou ao cadastrar ou salvar o arquivo"
            exit 0
        fi
    fi
fi

# Listar comandos cadastrados
if [ "$1" == "listar" ]; then
    echo "Comandos cadastrados:"
    for arquivo_comando in "$diretorio_comandos"/*.sh; do
        nome_comando=$(basename "$arquivo_comando" .sh)
        echo "- $nome_comando"
    done
    exit 0
fi

# Executar comandos cadastrados
if [ -f "$diretorio_comandos/$1.sh" ]; then 
    "$diretorio_comandos/$1.sh"
    exit $?
    else
    echo "comando ('$1') não encontrado!"
fi

if [ "$1" == "editar" ]; then
    FILE=$diretorio_comandos/"$2.sh"
    if test -f $FILE; then
        nano $diretorio_comandos/"$2.sh"
        exit 0
    else
        echo "Comando ou arquivo não encontrado! use (ctic listar) para listar comandos cadastrados."
        exit 0
    fi
fi
if [ "$1" == "remover" ]; then
    if [ "$2" ]; then
        rm $diretorio_comandos/"$2.sh"
        echo "Comando ("$2") removido com sucesso!"
        exit 0
    else
        echo "Arquivo ou comando não ecopntrado!"
        exit 0
    fi
fi
