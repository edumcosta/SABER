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
# Vers�o 5: Adicionadas op��es -s e --sort
# Vers�o 6: Adicionadas op��es -r, --reverse, -u, --uppercase,
#           leitura de m�ltiplas op��es (loop)
# Vers�o 7: Melhorias no c�digo para que fique mais leg�vel,
#           adicionadas op��es -d e --delimiter
#
# Aur�lio, Novembro de 2007
#

ordenar=0           # A sa�da dever� ser ordenada?
inverter=0          # A sa�da dever� ser invertida?
maiusculas=0        # A sa�da dever� ser em mai�sculas?
delim='\t'          # Caractere usado como delimitador de sa�da

MENSAGEM_USO="
Uso: $(basename "$0") [OP��ES]

OP��ES:
  -d, --delimiter C  Usa o caractere C como delimitador
  -r, --reverse      Inverte a listagem
  -s, --sort         Ordena a listagem alfabeticamente
  -u, --uppercase    Mostra a listagem em MAI�SCULAS

  -h, --help         Mostra esta tela de ajuda e sai
  -V, --version      Mostra a vers�o do programa e sai
"

# Tratamento das op��es de linha de comando
while test -n "$1"
do
	case "$1" in

		# Op��es que ligam/desligam chaves
		-s | --sort     ) ordenar=1    ;;
		-r | --reverse  ) inverter=1   ;;
		-u | --uppercase) maiusculas=1 ;;
		
		-d | --delimiter)
			shift
			delim="$1"
			
			if test -z "$delim"
			then
				echo "Faltou o argumento para a -d"
				exit 1
			fi
		;;
		
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
			echo Op��o inv�lida: $1
			exit 1
		;;
	esac
	
	# Op��o $1 j� processada, a fila deve andar
	shift
done

# Extrai a listagem
lista=$(cut -d : -f 1,5 /etc/passwd)

# Ordena, inverte ou converte para mai�sculas (se necess�rio)
test "$ordenar"    = 1 && lista=$(echo "$lista" | sort)
test "$inverter"   = 1 && lista=$(echo "$lista" | tac)
test "$maiusculas" = 1 && lista=$(echo "$lista" | tr a-z A-Z)

# Mostra o resultado para o usu�rio
echo "$lista" | tr : "$delim"
