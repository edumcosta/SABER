#!/bin/bash
# pega-url-3.sh
# Extrai o endere�o de um link HTML
#
# Aur�lio, Agosto de 2006

TEXTO="Google"

fgrep -i ">$TEXTO</a>" pagina[123].html |
 	tr A-Z a-z |
 	tr -d \" |
	sed 's/.*href=// ; s/>.*//'
