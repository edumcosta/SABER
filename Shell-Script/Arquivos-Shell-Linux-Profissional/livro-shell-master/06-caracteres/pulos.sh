#!/bin/bash
# pulos.sh
#
# Desenha na tela o gr�fico de exemplo dos pulos de cursor:
#
#    H
#    
#    F     A
#    G    D.C
#    E     B
#

# Explica��o dos c�digos est� no cap�tulo Caracteres de Controle
echo -e '\033c\033[HH\033[4;7H.C\033[3DD\033[AA\033[GF\nG\nE\033[7GB'
