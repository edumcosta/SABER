#!/bin/bash
# ambiente.sh

# Vamos mostrar uma p�gina HTML
echo Content-type: text/html
echo

# Mostra o nome do servidor no t�tulo
echo "<h1>Ambiente CGI - $SERVER_NAME</h1>"

# Mostra as vari�veis especiais do ambiente CGI
echo '<PRE>'
env | sort
