#!/bin/bash
# grita.sh
#
# Mostra uma palavra ($TXT) em mai�sculas e com exclama��es
# Exemplo: foo -> !!!!!FOO!!!!!

TXT="gritaria"

TXT="     $TXT     "            # Adiciona 5 espa�os ao redor
TXT=$(echo "$TXT" | tr ' ' '!') # Troca os espa�os por exclama��es
TXT=$(echo $TXT | tr a-z A-Z)   # Deixa o texto em mai�sculas
echo "$TXT"                     # Mostra a mensagem



TXT="gritaria"

TXT="     $TXT     "            # Adiciona 5 espa�os ao redor

set -v           # liga debug
trap read DEBUG  # liga passo a passo

TXT=$(echo "$TXT" | tr ' ' '!') # Troca os espa�os por exclama��es
TXT=$(echo $TXT | tr a-z A-Z)   # Deixa o texto em mai�sculas

trap "" DEBUG    # desliga passo a passo
set +v           # desliga debug

echo "$TXT"                     # Mostra a mensagem
