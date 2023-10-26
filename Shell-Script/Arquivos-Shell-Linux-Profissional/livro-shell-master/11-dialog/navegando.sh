#!/bin/bash
# navegando.sh - o script que vai e volta
#
# Exemplo de como ligar todas as telas do programa entre si,
# guardando informa��es de ida e volta. O bot�o CANCELAR faz
# voltar para a tela anterior e o OK faz ir � pr�xima. Para
# sair do programa a qualquer momento basta apertar o ESC.
#
# �til para fazer programas interativos, de contexto, ou que
# se pode voltar para corrigir informa��es.
#
# FLUXOGRAMA
#                    IN�CIO
#                 +-----------+
#                 | primeira  |--Esc--->---+
#      .--------> +----Ok-----+            |
#      `--Cancel--|   nome    |--Esc--->---+
#      .--------> +----Ok-----+            |     +----------+
#      `--Cancel--|   idade   |--Esc--->---+---> |  Sai do  |
#      .--------> +----Ok-----+            |     | Programa |
#      `--Cancel--| est.civil |--Esc--->---+     +----------+
#      .--------> +----Ok-----+            |
#      `--Cancel--|   gostos  |--Esc--->---+
#                 +----Ok-----+
#                 |   final   |
#                 +-----------+
#                      FIM
#

proxima='primeira'

# loop principal
while : ; do

	# Aqui � identificada qual tela deve ser mostrada.
	# Em cada tela s�o definidas as vari�veis 'anterior'
	# e 'proxima' # que definem os rumos da navega��o.
	case "$proxima" in
		primeira)
			proxima='nome'
			dialog --backtitle 'Pegador de Dados' \
				--msgbox 'Bem-vindo ao pegador de dados!' 0 0
			;;
		nome)
			anterior='primeira'
			proxima='idade'
			nome=$(dialog --stdout \
				--backtitle 'Pegador de Dados' \
				--inputbox 'Seu nome:' 0 0)
			;;
		idade)
			anterior='nome'
			proxima='casado'
			idade=$(dialog --stdout \
				--backtitle 'Pegador de Dados'   \
				--menu 'Qual a sua idade?' 0 0 0 \
				'menos de 15 anos'   '' \
				'entre 15 e 25 anos' '' \
				'entre 25 e 40 anos' '' \
				'mais de 40 anos'    '' )
			;;
		casado)
			anterior='idade'
			proxima='gostos'
			casado=$(dialog --stdout \
				--backtitle 'Pegador de Dados'    \
				--radiolist 'Estado civil:' 0 0 0 \
				'solteiro' 'livre leve solto' ON  \
				'noivo'    'quase amarrado'   OFF \
				'casado'   'j� era'           OFF \
				'vi�vo'    'livre de novo'    OFF )
			;;
		gostos)
			anterior='casado'
			proxima='final'
			gostos=$(dialog --stdout \
				--separate-output                      \
				--backtitle 'Pegador de Dados'         \
				--checklist 'Do que voc� gosta?' 0 0 0 \
				'jogar futebol'      '' off \
				'pescar'             '' off \
				'ir ao shopping'     '' off \
				'andar de bicicleta' '' off \
				'ficar na internet'  '' off \
				'dormir'             '' off )
			;;
		final)
			dialog \
				--cr-wrap \
				--sleep 15 \
				--backtitle 'Pegador de Dados'   \
				--title 'Obrigado por responder' \
				--infobox "Os dados informados foram
				Nome  : $nome
				Idade : $idade
				Casado: $casado
				Gostos: \n$gostos
				" 14 40
			break
			;;
		*)
			echo "Janela desconhecida '$proxima'."
			echo "Abortando programa..."
			exit
	esac

	# Aqui � feito o tratamento gen�rico de C�digo de Retorno
	# de todas as telas. Volta para a tela anterior se for
	# CANCELAR, sai do programa se for ESC.
	retorno=$?
	[ $retorno -eq 1   ] && proxima="$anterior"   # cancelar
	[ $retorno -eq 255 ] && break                 # Esc

done
