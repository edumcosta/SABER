#!/bin/bash
# form.sh

# Vamos mostrar uma p�gina HTML
echo Content-type: text/html
echo

echo "<H1>Os dados enviados foram:</H1>"
echo "<PRE>"

# L� os dados do formul�rio via STDIN
read TRIPA

# Mostra os dados na tela
echo "$TRIPA" | tr '&+' '\n '
