#!/bin/bash
# getopts-teste.sh
#
# Aur�lio, Novembro de 2007

# Loop que processa todas as op��es da linha de comando.
# Aten��o ao formato das op��es v�lidas ":sa:"
# - Os dois-pontos do in�cio ligam o modo silencioso
# - As op��es v�lidas s�o 'sa:', que s�o -s e -a
# - Os dois-pontos de 'a:' representam um argumento: -a FOO
#
while getopts ":sa:" opcao
do
	# $opcao guarda a op��o da vez (ou ? e : em caso de erro)
	# $OPTARG guarda o argumento da op��o (se houver)
	#
	case $opcao in
		 s) echo "OK Op��o simples (-s)";;
		 a) echo "OK Op��o com argumento (-a), recebeu: $OPTARG";;
		\?) echo "ERRO Op��o inv�lida: $OPTARG";;
		 :) echo "ERRO Faltou argumento para: $OPTARG";;
	esac
done

# O loop termina quando nenhuma op��o for encontrada.
# Mas ainda podem existir argumentos, como um nome de arquivo.
# A vari�vel $OPTIND guarda o �ndice do resto da linha de
# comando, �til para arrancar as op��es j� processadas.
#
echo
shift $((OPTIND - 1))
echo "INDICE: $OPTIND"
echo "RESTO: $*"
echo
