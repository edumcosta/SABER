#!/bin/bash
# brlinux-2.sh
# Mostra as 5 �ltimas manchetes do BR-Linux
# Vers�o 2 que procura no c�digo HTML
#
# Aur�lio, Agosto de 2006

URL="http://br-linux.org"

# O padr�o s�o linhas com "<h1><a style".
# O sed remove as tags HTML, restaura as aspas e
# apaga os espa�os do in�cio.
# O head limita o n�mero de manchetes em 5.
#
lynx -source "$URL" |
	grep '<h1><a style' |
	sed '
		s/<[^>]*>//g
		s/&quot;/"/g
		s/^  *//' |
	head -n 5
