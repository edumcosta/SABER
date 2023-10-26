# bantex.sh - Gerenciador do Banco Textual
#
# Biblioteca de fun��es para gerenciar os dados do banco textual.
# Use o comando "source" para inclui-la em seu script.
#
# 2006-10-31 Fulano da Silva
#

#--------------------------------[ configura��o ]-----------------------------

SEP=:                     # defina aqui o separador, padr�o � :
TEMP=temp.$$              # arquivo tempor�rio


#----------------------------------[ fun��es ]--------------------------------

# O arquivo texto com o banco j� deve estar definido
[ "$BANCO" ] || {
	echo "Base de dados n�o informada. Use a vari�vel BANCO."
	return 1
}

# Apaga o registro da chave $1 do banco
apaga_registro() {
	grep -i -v "^$1$SEP" "$BANCO" > "$TEMP"      # apaga a chave
	mv "$TEMP" "$BANCO"                          # regrava o banco
}

# Insere o registro $* no banco
insere_registro() {
	echo "$*" >> "$BANCO"                        # grava o registro
}
