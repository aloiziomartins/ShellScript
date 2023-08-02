#!/bin/bash
#
#Objetivo é criar backup para Gdrive usando rclone
#
# Parte 1:
#	Origem, destino e tipo de compactação
#	Concluída dia 31/07/2023
#
# Parte 2:
#	Teste de condicionais e criar logs dos backup
# 	concluída dia 31/07/2023
#
# Próxmas etapas:
# TODO 1> Sincronizar backup com diretório.
# TODO 2> Restauração de backup.
# TODO 3> Política de backup - Subjetiva a necessidade, risco, espaço disponível.
#
# 
#
#
#martins.aloizio@gmail.com
##########################################################################
# Variáveis 
Data=$(date)
PastaOrigem="/home/user/Documentos"
PastaDestino="/home/backup"  
#
Arquivo=$(date +backup-%Y-%m-%d.tar.gz)
log="/home/user/ShellScript/logs/backup.log"

#Checa Pasta de origem
if ! [ -d "$PastaOrigem" ]; then
    printf "[$Data] - Pasta de Origem inacessível!\n" >> $log
    exit 1
fi
# Checa Destino
if ! [ -d "$PastaDestino" ]; then
    printf "[$Data] - Diretório de destino não montado ou inexistente!\n" >> $log
    exit 1
fi
#faz Backup
if ! tar -czSpf "$PastaDestino/$Arquivo" "$PastaOrigem" 2>> $log; then
    printf "[$Data] - Erro ao fazer compactar backup \n" >> $log
    exit 1
else
    printf "[$Data] - Sucesso!\n" >> $log
fi
