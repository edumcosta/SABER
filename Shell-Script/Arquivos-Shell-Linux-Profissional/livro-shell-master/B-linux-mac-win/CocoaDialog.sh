#!/bin/bash

CD="/Applications/CocoaDialog.app/Contents/MacOS/CocoaDialog"

resposta=$($CD ok-msgbox \
	--text "T�tulo da janela" \
	--informative-text "Texto de dentro da janela" \
	--no-newline --float)

case "$resposta" in
	1) echo "O usu�rio apertou o bot�o OK";;
	2) echo "O usu�rio apertou o bot�o Cancel";;
esac
