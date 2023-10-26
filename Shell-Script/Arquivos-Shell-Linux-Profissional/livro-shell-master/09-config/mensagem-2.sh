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

	# DICA:
	# Basta referenciar o $LINHA sem aspas para que todos
	# os brancos do in�cio e fim da linha sejam removidos,
	# e os espa�os e TABs entre a chave e o valor sejam
	# convertidos para apenas um espa�o normal.
	#
	# Descomente as linhas seguintes para testar
	echo Com aspas: "$LINHA"
	echo Sem aspas: $LINHA

	# Ignorando as linhas de coment�rio
	[ "$(echo $LINHA | cut -c1)" = '#' ] && continue

	# Ignorando as linhas em branco
	[ "$LINHA" ] || continue

	# Quem sobrou?
	echo +++ $LINHA

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
