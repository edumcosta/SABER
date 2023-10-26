#!/bin/bash

# Função para criptografar dados
criptografar() {
    echo -n "$1" | openssl enc -aes-256-cbc -salt -pass pass:$CHAVE_SECRETA -out /app/dados/dados_criptografados.enc
}

# Função para descriptografar dados
descriptografar() {
    openssl enc -d -aes-256-cbc -pass pass:$CHAVE_SECRETA -in /app/dados/dados_criptografados.enc
}

# Menu de opções
while true; do
    echo "Escolha uma opção:"
    echo "1. Criptografar dados sensíveis"
    echo "2. Descriptografar dados"
    echo "3. Sair"

    read opcao

    case $opcao in
        1)
            echo "Digite os dados sensíveis a serem criptografados:"
            read dados_sensiveis
            criptografar "$dados_sensiveis"
            echo "Dados criptografados e armazenados no arquivo 'dados_criptografados.enc'."
            ;;
        2)
            if [ -f /app/dados/dados_criptografados.enc ]; then
                dados_descriptografados=$(descriptografar)
                echo "Dados descriptografados: $dados_descriptografados"
            else
                echo "O arquivo 'dados_criptografados.enc' não existe. Criptografe os dados primeiro."
            fi
            ;;
        3)
            echo "Saindo..."
            exit 0
            ;;
        *)
            echo "Opção inválida. Por favor, escolha uma opção válida."
            ;;
    esac
done
