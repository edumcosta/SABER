#!/bin/bash
# usuarios.sh
#
# Mostra os logins e nomes de usu�rios do sistema
# Obs.: L� dados do arquivo /etc/passwd
#
# Aur�lio, Novembro de 2007
#

cut -d : -f 1,5 /etc/passwd | tr : \\t
