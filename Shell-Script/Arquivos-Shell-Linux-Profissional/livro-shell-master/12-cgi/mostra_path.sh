#!/bin/bash
# mostra_path.sh

# Adiciona um diret�rio falso ao PATH
PATH=$PATH:/noel

# Para cada diret�rio do $PATH...
IFS=:
for diretorio in $PATH; do
	
	# Confirme se ele existe
	if test -d $diretorio; then
		extra="existe"
	else
		extra="n�o existe"
	fi
	
	# E mostre o resultado na tela
	echo "$diretorio ($extra)"
done
