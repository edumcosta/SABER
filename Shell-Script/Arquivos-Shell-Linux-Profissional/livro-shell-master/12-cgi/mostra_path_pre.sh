#!/bin/bash
# mostra_path_pre.sh

# Vamos mostrar uma p�gina HTML
echo Content-type: text/html
echo

# Adiciona um diret�rio falso ao PATH
PATH=$PATH:/noel

# Inicia um texto pr�-formatado
echo "<PRE>"

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

# Fecha o texto pr�-formatado
echo "</PRE>"
