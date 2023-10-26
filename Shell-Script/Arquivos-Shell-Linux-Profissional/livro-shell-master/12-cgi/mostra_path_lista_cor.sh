#!/bin/bash
# mostra_path_lista_cor.sh

# Vamos mostrar uma p�gina HTML
echo Content-type: text/html
echo

# Adiciona um diret�rio falso ao PATH
PATH=$PATH:/noel

# T�tulo da p�gina
echo "<h1>Componentes de seu PATH</h1>"

# Inicia uma lista de itens
echo "<UL>"

# Para cada diret�rio do $PATH...
IFS=:
for diretorio in $PATH; do
	
	# Confirme se ele existe
	if test -d $diretorio; then
		extra='<FONT COLOR="green">existe</FONT>'
	else
		extra='<FONT COLOR="red">n�o existe</FONT>'
	fi
	
	# E mostre o resultado na tela (item da lista)
	echo "<LI>$diretorio $extra</LI>"
done

# Fecha a lista
echo "</UL>"
