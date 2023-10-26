#!/bin/bash
# brlinux-3.sh
# Mostra as 5 �ltimas manchetes do BR-Linux
# Vers�o 3 que procura no Feed XML
#
# Aur�lio, Agosto de 2006

URL="http://br-linux.org/linux/node/feed"

# O padr�o s�o linhas com "<title>".
# O sed remove as tags HTML, restaura as aspas,
# apaga os espa�os do in�cio e remove a primera linha.
# O head limita o n�mero de manchetes em 5.
#
lynx -source "$URL" |
	grep '<title>' |
	sed '
		s/<[^>]*>//g
		s/&quot;/"/g
		s/^  *//
		1d' |
	head -n 5
