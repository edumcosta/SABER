#!/bin/bash
# mostra_path_lista.sh

# Vamos mostrar uma p�gina HTML
echo Content-type: text/html
echo

# Adiciona um diret�rio falso ao PATH
PATH=$PATH:/noel

# Inicia uma lista de itens
echo "<UL>"

# Para cada diret�rio do $PATH...
IFS=:
for diretorio in $PATH; do
	
	# Confirme se ele existe
	if test -d $diretorio; then
		extra="existe"
	else
		extra="n�o existe"
	fi
	
	# E mostre o resultado na tela (item da lista)
	echo "<LI>$diretorio ($extra)</LI>"
done

# Fecha a lista
echo "</UL>"
