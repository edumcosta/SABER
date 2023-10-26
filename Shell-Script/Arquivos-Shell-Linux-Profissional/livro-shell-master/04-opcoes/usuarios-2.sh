#!/bin/bash
# usuarios.sh
#
# Mostra os logins e nomes de usu�rios do sistema
# Obs.: L� dados do arquivo /etc/passwd
#
# Vers�o 1: Mostra usu�rios e nomes separados por TAB
# Vers�o 2: Adicionado suporte � op��o -h
#
# Aur�lio, Novembro de 2007
#

MENSAGEM_USO="
Uso: $0 [-h]

  -h		Mostra esta tela de ajuda e sai
"

# Tratamento das op��es de linha de comando
if test "$1" = "-h"
then
	echo "$MENSAGEM_USO"
	exit 0
fi

# Processamento
cut -d : -f 1,5 /etc/passwd | tr : \\t
