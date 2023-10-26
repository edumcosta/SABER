#!/bin/bash
# parser.sh
# L� arquivos de configura��o e converte os dados para
# vari�veis do shell na sa�da padr�o.
#
# 2006-10-31 Fulano da Silva
#

# O arquivo de configura��o � indicado na linha de comando
CONFIG=$1

# O arquivo deve existir e ser leg�vel
if [ -z "$CONFIG" ]; then
	echo Uso: parser arquivo.conf
	exit 1
elif [ ! -r "$CONFIG" ]; then
	echo Erro: N�o consigo ler o arquivo $CONFIG
	exit 1
fi

# Loop para ler linha a linha a configura��o, guardando em $LINHA
# Dica: Use $LINHA sem "aspas" para remover os brancos
while read LINHA; do

	# Ignorando as linhas de coment�rio
	[ "$(echo $LINHA | cut -c1)" = '#' ] && continue

	# Ignorando as linhas em branco
	[ "$LINHA" ] || continue

	# Guardando cada palavra da linha em $1, $2, $3, ...
	set - $LINHA
	
	# Extraindo os dados (chaves sempre mai�sculas)
	chave=$(echo $1 | tr a-z A-Z)
	shift
	valor=$*
	
	# Mostrando chave="valor" na sa�da padr�o
	echo "CONF_$chave=\"$valor\""

done < "$CONFIG"
