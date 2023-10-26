#!/bin/bash
# grita.sh
#
# Mostra uma palavra ($TXT) em mai�sculas e com exclama��es
# Exemplo: foo -> !!!!!FOO!!!!!

TXT="gritaria"

TXT="     $TXT     "            # Adiciona 5 espa�os ao redor
TXT=$(echo $TXT | tr ' ' '!')   # Troca os espa�os por exclama��es
TXT=$(echo $TXT | tr a-z A-Z)   # Deixa o texto em mai�sculas
echo "$TXT"                     # Mostra a mensagem
