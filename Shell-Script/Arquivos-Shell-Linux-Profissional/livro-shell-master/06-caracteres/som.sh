#!/bin/bash
# som.sh
# Demonstra��o de mudan�a da freq��ncia do Speaker
# Dica: Digite Ctrl+C para finalizar.
#

# Restaura o bipe padr�o (f=750, t=100ms)
echo -e '\033[10;750]\033[11;100]'

freq=0                          # freq��ncia inicial
while : ; do                    # loop infinito
	freq=$((freq+1))                # aumenta freq��ncia
	echo -e "\033[10;$freq]"        # muda freq��ncia no Speaker
	echo    "frequ�ncia=$freq"      # mostra freq��ncia atual
	echo -e '\a'                    # emite um bipe
	usleep 100                      # espera 100us
done
