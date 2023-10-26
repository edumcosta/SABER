#!/bin/bash
# brlinux-2008-1.sh
# Mostra as 5 �ltimas manchetes do BR-Linux
# Vers�o 1 que procura no texto
#
# Aur�lio, Mar�o de 2008

URL="http://br-linux.org"

# O padr�o s�o linhas que iniciam com mai�sculas.
# A primeira linha � apagada, pois � o nome do site.
#
lynx -dump -nolist "$URL" |
	grep '^[A-Z]' |
	sed '1d' |
	head -n 5
