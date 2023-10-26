#!/bin/bash
# usuarios.sh
#
# Mostra os logins e nomes de usu�rios do sistema
# Obs.: L� dados do arquivo /etc/passwd
#
# Vers�o 1: Mostra usu�rios e nomes separados por TAB
# Vers�o 2: Adicionado suporte � op��o -h
# Vers�o 3: Adicionado suporte � op��o -V e op��es inv�lidas
#
# Aur�lio, Novembro de 2007
#

MENSAGEM_USO="
Uso: $0 [-h | -V]

  -h		Mostra esta tela de ajuda e sai
  -V		Mostra a vers�o do programa e sai
"

# Tratamento das op��es de linha de comando
case "$1" in
	-h)
		echo "$MENSAGEM_USO"
		exit 0
	;;

	-V)
		echo $0 Vers�o 3
		exit 0
	;;

	*)
		echo Op��o inv�lida: $1
		exit 1
	;;
esac

# Processamento
cut -d : -f 1,5 /etc/passwd | tr : \\t
