#!/bin/bash
#
# seq.sh - Emula��o do comando seq em Bash, por Aur�lio M. Jargas
#
# O comando seq recebe dois n�meros e mostra na sa�da padr�o todos os n�meros
# existentes entre eles, inclusive. Essa seq��ncia est� pronta para ser usada
# pelo comando FOR. Caso omitido o n�mero inicial, � utilizado o 1.
#
#        Exemplo 1           Exemplo 2            Exemplo 3
#
#        $ seq 5 10          $ seq 10 5           $ seq 5
#        5                   10                   1
#        6                   9                    2
#        7                   8                    3
#        8                   7                    4
#        9                   6                    5
#        10                  5
#
# Uso em scripts: for i in $(seq 5 10); do comandos ; done
#

### Inicializa��o das vari�veis
o=+           # Opera��o a ser feita. Pode ser + ou -
a=1           # Valor padr�o de in�cio da contagem
z=${1:-1}     # Valor do final da contagem recebido em $1 (padr�o � 1)

# A vari�vel 'a' � o n�mero de in�cio e a vari�vel 'z' � o final.
#
# O c�digo anterior serve para quando o usu�rio passar apenas um valor na
# linha de comando, que seria o valor do *final* da contagem. Por isso
# a=1 e z=$1.
#
# Caso o programa seja chamado sem par�metros, 'z' tamb�m � definido
# como 1. Como a=1 e z=1, o programa retorna apenas o n�mero 1.

[ "$2" ] && {

	# Foram passados 2 par�metros, o $1 � o in�cio e o $2 � o fim.
	a=$1
	z=$2
}

###
# Se o n�mero inicial ($a) for maior que o n�mero final ($z),
# faremos uma contagem regressiva, por isso a opera��o � definida
# como subtra��o.
#
[ $a -gt $z ] && o=-

###
# Loop da contagem (progressiva ou regressiva)
#
# A cada volta, adiciona ou subtrai 1 do valor inicial,
# at� que ele se iguale ao final.
#
# O eval executa o resultado da expans�o de vari�veis.
# Supondo o='+' e a=3, o eval executar� o comando a=$((3+1)).
#
while [ $a -ne $z ]; do
	echo $a                 # mostra a contagem atual
	eval "a=\$((a $o 1))"   # efetua a opera��o (+1 ou -1)
done
echo $a                         # mostra o �ltimo n�mero
