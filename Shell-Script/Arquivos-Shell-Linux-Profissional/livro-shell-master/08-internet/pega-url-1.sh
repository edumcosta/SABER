#!/bin/bash
# pega-url-1.sh
# Extrai o endere�o de um link HTML
#
# Aur�lio, Agosto de 2006

TEXTO="Google"

fgrep "$TEXTO" pagina1.html | cut -d\" -f2
