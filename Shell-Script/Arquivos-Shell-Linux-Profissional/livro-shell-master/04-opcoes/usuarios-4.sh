#!/bin/bash
# usuarios.sh
#
# Mostra os logins e nomes de usu�rios do sistema
# Obs.: L� dados do arquivo /etc/passwd
#
# Vers�o 1: Mostra usu�rios e nomes separados por TAB
# Vers�o 2: Adicionado suporte � op��o -h
# Vers�o 3: Adicionado suporte � op��o -V e op��es inv�lidas
# Vers�o 4: Arrumado bug quando n�o tem op��es, basename no
#           nome do programa, -V extraindo direto dos cabe�alhos,
#           adicionadas op��es --help e --version
#
# Aur�lio, Novembro de 2007
#

MENSAGEM_USO="
Uso: $(basename "$0") [-h | -V]

  -h, --help        Mostra esta tela de ajuda e sai
  -V, --version     Mostra a vers�o do programa e sai
"

# Tratamento das op��es de linha de comando
case "$1" in
	-h | --help)
		echo "$MENSAGEM_USO"
		exit 0
	;;

	-V | --version)
		echo -n $(basename "$0")
		# Extrai a vers�o diretamente dos cabe�alhos do programa
		grep '^# Vers�o ' "$0" | tail -1 | cut -d : -f 1 | tr -d \#
		exit 0
	;;

	*)
		if test -n "$1"
		then
			echo Op��o inv�lida: $1
			exit 1
		fi
	;;
esac

# Processamento
cut -d : -f 1,5 /etc/passwd | tr : \\t
