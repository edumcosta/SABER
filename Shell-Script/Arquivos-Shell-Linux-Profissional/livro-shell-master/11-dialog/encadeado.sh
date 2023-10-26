#!/bin/bash
# encadeado.sh - o script que chega at� o final
#
# Exemplo de como encadear telas usando o operador && (AND).
# Caso o usu�rio desista em qualquer tela (apertando CANCELAR
# ou ESC), o script executa o primeiro comando ap�s a cadeia
# de &&.
#
# �til para fazer programas ou brincadeiras onde s� h� um
# caminho certo a seguir para chegar ao final.
#
# FLUXOGRAMA
#             IN�CIO
#            +-------+
#            | tela1 |--Cancel/Esc--->---+
#            +--Ok---+                   |
#            | tela2 |--Cancel/Esc--->---+     +----------+
#            +--Ok---+                   |---> | desistiu |
#            | tela3 |--Cancel/Esc--->---+     +----------+
#            +--Ok---+                   |
#            | tela4 |--Cancel/Esc--->---+
#            +--Ok---+
#            | final |
#            +-------+
#               FIM
#

# Fun��o r�pida para chamar a caixa YesNo
simnao(){
	dialog --yesno "$*" 0 0
}

# Aqui come�a o encadeamento de telas com o &&.
# Somente apertando o bot�o OK vai para a pr�xima tela.
# H� um 'exit' no final, que sai do script caso o usu�rio
# tenha chegado at� o fim da cadeia.
simnao 'Quer continuar?'                    &&
simnao 'Estamos na segunda tela. Continua?' &&
simnao 'Terceira. Continua continuando?'    &&
simnao 'Pen�ltima tela! E agora, continua?' &&
echo 'Voc� chegou at� o final!'             && exit

# Este trecho j� n�o faz mais parte do encadeamento e s�
# ser� alcan�ado caso o usu�rio tenha apertado CANCELAR/Esc.
echo Voc� desistiu antes de chegar no final...
