#!/bin/bash
# pega-url-2.sh
# Extrai o endere�o de um link HTML
#
# Aur�lio, Agosto de 2006

TEXTO="Google"

fgrep ">$TEXTO</a>" pagina[12].html | sed 's/.*href="// ; s/".*//'
