#!/bin/bash
# brlinux-2008-2.sh
# Mostra as 5 �ltimas manchetes do BR-Linux
# Vers�o 2 que procura no c�digo HTML
#
# Aur�lio, Mar�o de 2008

URL="http://br-linux.org"

# O padr�o s�o linhas com "<h2><a href".
# O sed remove as tags HTML, restaura as aspas e
# apaga os espa�os do in�cio.
# O head limita o n�mero de manchetes em 5.
#
lynx -source "$URL" |
	grep '<h2><a href' |
	sed '
		s/<[^>]*>//g
		s/&quot;/"/g' |
	tr -d '\t' |
	head -n 5
