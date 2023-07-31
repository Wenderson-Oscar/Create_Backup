#!/bin/bash

function exibir_erro_sair() {
    echo "Erro: $1"
    exit 1
}

read -p "Digite o caminho do diretório a ser copiado: " diretorio_origem

if [ ! -d "$diretorio_origem" ]; then
    exibir_erro_sair "O diretório especificado não existe ou é inválido."
fi

read -p "Digite o nome do arquivo de backup: " nome_backup

tar -czf "$nome_backup.tar.gz" "$diretorio_origem"

if [ $? -eq 0 ]; then
    echo "Backup criado com sucesso!"
    echo "Caminho do arquivo de backup: $(pwd)/$nome_backup.tar.gz"
else
    exibir_erro_sair "Ocorreu um erro ao criar o backup."
fi
