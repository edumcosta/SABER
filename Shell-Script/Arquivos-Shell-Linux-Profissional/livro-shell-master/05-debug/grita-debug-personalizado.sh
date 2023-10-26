#!/bin/bash
# grita.sh
#
# Mostra uma palavra ($TXT) em mai�sculas e com exclama��es
# Exemplo: foo -> !!!!!FOO!!!!!

DEBUG=1                         # depura��o: 0 desliga, 1 liga

# Fun��o de depura��o
Debug(){
	[ "$DEBUG" = 1 ] && echo "$*"
}

TXT="gritaria"

TXT="     $TXT     "            # Adiciona 5 espa�os ao redor

Debug "TXT com espa�os    : [$TXT]"
TXT=$(echo $TXT | tr ' ' '!')   # Troca os espa�os por exclama��es
Debug "TXT com exclama��es: [$TXT]"

TXT=$(echo $TXT | tr a-z A-Z)   # Deixa o texto em mai�sculas
echo "$TXT"                     # Mostra a mensagem
