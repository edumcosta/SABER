#!/bin/bash
#
# mensagem.sh
# Mostra uma mensagem colorida na tela, lendo os
# dados de um arquivo de configura��o externo.
#
# 2006-10-31 Fulano da Silva

CONFIG="mensagem.conf"            # Arquivo de configura��o

# Configura��es (ser�o lidas do $CONFIG)
USAR_CORES=0                      # config: UsarCores
COR_LETRA=                        # config: CorLetra
COR_FUNDO=                        # config: CorFundo
MENSAGEM='Mensagem padr�o'        # config: Mensagem

# Loop para ler linha a linha a configura��o, guardando em $LINHA
while read LINHA; do
	# Comando vazio, que n�o faz nada
	:
done < "$CONFIG"

# Configura��es lidas, mostre a mensagem

if [ $USAR_CORES -eq 1 ]; then
	# Mostrar mensagem colorida
	# Exemplo: \033[40;32mOl�\033[m
	echo -e "\033[$COR_FUNDO;${COR_LETRA}m$MENSAGEM\033[m"
else
	# N�o usar cores
	echo "$MENSAGEM"
fi
