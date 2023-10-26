# bantex.sh - Gerenciador do Banco Textual
#
# Biblioteca de fun��es para gerenciar os dados do banco textual.
# Use o comando "source" para inclui-la em seu script.
#
# 2006-10-31 Fulano da Silva

#--------------------------------[ configura��o ]-----------------------------

TEMP=temp.$$              # arquivo tempor�rio


#----------------------------------[ fun��es ]--------------------------------

# O arquivo texto com o banco j� deve estar definido
[ "$BANCO" ] || {
	echo "Base de dados n�o informada. Use a vari�vel BANCO."
	return 1
}

# O arquivo deve poder ser lido e gravado
[ -r "$BANCO" -a -w "$BANCO" ] || {
	echo "Base travada, confira as permiss�es de leitura e escrita."
	return 1
}

# Verifica se a chave $1 est� no banco
tem_chave() {
	grep -iw -q "^$1" "$BANCO"
}

# Apaga o registro da chave $1 do banco
apaga_registro() {
	tem_chave "$1" || return                     # se n�o tem, nem tente
	grep -iw -v "^$1" "$BANCO" > "$TEMP"         # apaga a chave
	mv "$TEMP" "$BANCO"                          # regrava o banco
	echo "O registro '$1' foi apagado"
}

# Insere o registro $* no banco
insere_registro() {
	local chave=$(echo "$1" | cut -f1)   # pega primeiro campo

	if tem_chave "$chave"; then
		echo "A chave '$chave' j� est� cadastrada no banco."
		return 1
	else                                         # chave nova
		echo "$*" >> "$BANCO"                     # grava o registro
		echo "Registro de '$chave' cadastrado com sucesso."
	fi
	return 0
}

# Mostra o valor do campo n�mero $1 do registro de chave $2 (opcional)
pega_campo() {
	local chave=${2:-.*}
	grep -iw "^$chave" "$BANCO" | cut -f $1
}

# Mostra os nomes dos campos do banco, um por linha
campos() {
	head -n 1 "$BANCO" | tr \\t \\n
}

# Mostra os dados do registro da chave $1
mostra_registro() {
	local dados=$(grep -iw "^$1" "$BANCO")
	local i=0
	[ "$dados" ] || return                       # n�o achei
	campos | while read campo; do                # para cada campo...
		i=$((i+1))                                # �ndice do campo
		echo -n "$campo: "                        # nome do campo
		echo "$dados" | cut -f $i                 # conte�do do campo
	done
}
