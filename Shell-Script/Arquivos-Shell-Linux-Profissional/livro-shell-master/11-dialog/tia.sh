#!/bin/bash
# tia.sh - o script da tia que precisa usar o computador
#
# Exemplo de como amarrar o script em um menu principal usando
# o 'while'. O 'case' � usado para identificar qual foi a a��o
# escolhida. Ap�s cada a��o, ele sempre retorna ao menu
# principal. S� sai do script caso escolha a �ltima op��o,
# aperte CANCELAR ou ESC.
#
# �til para usar como login shell de pessoas inexperientes ou
# fazer utilit�rios de a��es restritas e definidas.
#
# FLUXOGRAMA
#                      IN�CIO                    FIM
#                   +-----------+            +----------+
#          +------> |    menu   |--Esc-----> |  sai do  |
#          |        | principal |--Cancel--> | programa |
#          |        +-----Ok----+       +--> +----------+
#          |              |             |
#          +--<--1 2 3-4--+--Zero--->---+

# Loop que mostra o menu principal
while : ; do

	# Mostra o menu na tela, com as a��es dispon�veis
	resposta=$(
		dialog --stdout            \
			--title 'Menu da Tia'   \
			--menu 'Oi Tia, escolha o que voc� quer fazer:' \
			0 0 0                   \
			1 'Navegar na Internet' \
			2 'Escrever uma carta'  \
			3 'Jogar paci�ncia'     \
			4 'Perder tempo'        \
			0 'Sair'                )

	# Ela apertou CANCELAR ou ESC, ent�o vamos sair...
	[ $? -ne 0 ] && break

	# De acordo com a op��o escolhida, dispara programas
	case "$resposta" in
		1) firefox 'http://google.com.br' ;;
		2) nano /tmp/carta.txt ;;
		3) /usr/games/solitaire ;;
		4) xsnow ; xeyes ;;
		0) break ;;
	esac
done

echo 'Tchau Tia!'       # Mensagem final :)
