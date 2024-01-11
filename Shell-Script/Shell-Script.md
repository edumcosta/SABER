# Shell Script

## Comandos 

**Comando: echo [opções] [argumentos]**

Descrição: O comando "echo" mostra texto na saída padrão seguido por uma nova linha.

Algumas opções do comando:
- -n : não adiciona uma nova linha após mostrar os argumentos.
- -e : habilita interpretação dos códigos de escape após barra invetida.
- -E : suprime explicitamente a interpretação de códigos de escape após barra invertida.

São exemplos de códigos de escape: Para utilizar os códigos abaixo é preciso a opção "-e".

- \a : alerta (Sino).
- \b : retroceder.
- \c : suprime próxima saída.
- \e : caractere de escape.
- \f : alimentação de página (FF).
- \n : nova linha (NL).
- \r : retorno de carro (CR).
- \t : tabulação horizontal.
- \v : tabulação vertical.

echo -n teste [Imprime teste mais sem quebra de linha. Útil para compor com uma linha where receberá a netrada de um valor.]

echo -e "coluna1\t\tcoluna2\nLinha1\t\tlinha2" [Simula espaço TAB "\t" e quebra linha com "\n"]


**Comando: cat**

Descrição: O comando "cat" é utilizado para extrair informações presentes em arquivos.

Principais opções do comando "cat":
- -b : Enumera as linhas que não estiverem em branco.
- -m : Enumera todas as linhas e mesmo as que estiverem em branco.
- -A : Apresenta os caracteres especiais de controle, como fim da linha, Tabs. Esse comando ajuda a avaliar como as colunas estão dispostas e tamanhos de linhas.

**Comando: tac**

Descrição: O comando "tac" é utilizado para extrair informações presentes em arquivos onde a saída conterá a última linha do arquivo como a primeira linha e a última linha corresponderá a primeira linha do arquivo.

**Comando: tail**

Descrição: O comando "tail" é utilizado para extrair informações presentes no fim de arquivos. Por padrão ele apresenta as 10 últimas linhas de um arquivo, onde a saída conterá a última linha do arquivo como a primeira linha e a última linha corresponderá a primeira linha do arquivo.

Principais opções do comando "tail":
- -n[valor] ou -[valor] : Indica o números de linhas que deverão ser apresentadas.
- -c[valor] : Quantidade de caracteres que deverão ser exibidos.

**Comando: head**

Descrição: O comando "head" é utilizado para extrair informações presentes no início de arquivos. Por padrão ele apresenta as 10 primeiras linhas de um arquivo.

Principais opções do comando "head":
- -n[valor] ou -[valor] : Indica o números de linhas que deverão ser apresentadas.
- -c[valor] : Quantidade de caracteres que deverão ser exibidos.

**Comando: wc**

Descrição: O comando "wc" é utilizado para contar caracteres, palavras e linhas de arquivos. 

Exemplo:

```
edumcosta@vm-ubuntu-l22-h:~$ wc 00-installer-config.bak
6  16 115 00-installer-config.bak 
```
No exemplo acima a saída do comando wc é:
 - 6 : Corresponde ao número de linhas.
 - 16 : Corresponde ao número de palavras.
 - 115 : Corresponde ao número de caracteres.

Principais opções do comando "wc":
- -l : Mostra o número de linhas.
- -w : Mostra a quantidade de palavras.
- -m : Mostra a quantidade de caracteres.
- -c : Número de bytes. Apresenta a mesma informação que o -m (1 byte = 1 caracter).

**Comando: sort**

Descrição: O comando "sort" ordena a saída de um arquivo. Por padrão a ordenação é crescente e pelo primeiro campo, primeira palavra.

Principais opções do comando "sort":
- -r : Mostra de forma decrescente.
- -k[valor] : Indica por qual campo o arquivo deverá ser ordenado.
- -t["caracter"] : Indica qual o delimitador de um campo. O caracteres separador deve ser indicado entre aspas.
- -g : Indica que a ordenação deve ser baseada em valores núméricos.
- -n : Indica que a ordenação deve ser baseada em valores texto.

No exemplo abaixo vamos utilizar o comando "tail" para recuperar as últimas 5 linhas de informações do arquivo /etc/passwd e ordernar a sua saída pela coluna 3 (ID do usuário) e que é representada por um valor númérico. 
```
edumcosta@vm-ubuntu-l22-h:~$ tail -n5 /etc/passwd | sort -k3 -t":" -g
systemd-timesync:x:104:105:systemd Time Synchronization,,,:/run/systemd:/usr/sbin/nologin
pollinate:x:105:1::/var/cache/pollinate:/bin/false
sshd:x:106:65534::/run/sshd:/usr/sbin/nologin
usbmux:x:107:46:usbmux daemon,,,:/var/lib/usbmux:/usr/sbin/nologin
edumcosta:x:1000:1000:Eduardo Martins da Costa:/home/edumcosta:/bin/bash
```
Abaixo a saída da coluna 3 sem a indicação da oridenação baseada em valores numéricos, no qual o valor "1000" é apresentado como a primeira linha da ordenação e no exemplo anterior ela é a última.
```
edumcosta@vm-ubuntu-l22-h:~$ tail -n5 /etc/passwd | sort -k3 -t":"
edumcosta:x:1000:1000:Eduardo Martins da Costa:/home/edumcosta:/bin/bash
systemd-timesync:x:104:105:systemd Time Synchronization,,,:/run/systemd:/usr/sbin/nologin
pollinate:x:105:1::/var/cache/pollinate:/bin/false
sshd:x:106:65534::/run/sshd:/usr/sbin/nologin
usbmux:x:107:46:usbmux daemon,,,:/var/lib/usbmux:/usr/sbin/nologin
```

**Comando: uniq**

Descrição: O comando "uniq" apresenta a saída de um arquivo, no qual as linhas repetidas e de forma sequencial, são suprimidas. Caso existam linhas iguais e que não estejam de forma sequencial, use o comando sort em conjunto para ordená-las e suprimí-las.

Principais opções do comando "uniq":
- -u : Mostra só o que apareceu uma vez só.
- -d : Mostra as linhas repetidas sem apresentar as linhas em duplicidade.
- -c : Mostra as linhas repetidas, sem apresentar as linhas em duplicidade e apresenta as quatidades de repetições.  

**Comando: tr**

Descrição: O comando "tr" faz a tradução de caracteres ou substituição.

Principais opções do comando "tr":
- -d [caractere] : Apaga caracteres. 
- -s [caractere] : Suprime repetições de caracteres. 

Além das opções acima o "tr" pode ser utilizado com expressões:
- \\              : backslash
- \a              : audible BEL
- \b              : backspace
- \f              : form feed
- \n              : new line
- \r              : return
- \t              : horizontal tab
- \v              : vertical tab
- CHAR1-CHAR2     : all characters from CHAR1 to CHAR2 in ascending order
- [CHAR*]         : in SET2, copies of CHAR until length of SET1
- [CHAR*REPEAT]   : REPEAT copies of CHAR, REPEAT octal if starting with 0
- [:alnum:]       : all letters and digits
- [:alpha:]       : all letters
- [:blank:]       : all horizontal whitespace
- [:cntrl:]       : all control characters
- [:digit:]       : all digits
- [:graph:]       : all printable characters, not including space
- [:lower:]       : all lower case letters
- [:print:]       : all printable characters, including space
- [:punct:]       : all punctuation characters
- [:space:]       : all horizontal or vertical whitespace
- [:upper:]       : all upper case letters
- [:xdigit:]      : all hexadecimal digits
- [=CHAR=]        : all characters which are equivalent to CHAR

Exemplos:
- tr a e : Troca todas as ocorrências do caractere "a" por "e".
- tr a A : Troca todas as ocorrências do caractere "a" por "A".
- tr a-z A-Z : Troca todas as ocorrências do caractere minúsculos de "a" a "z" por seus respectivos maiúsculos.
- tr [:lower:] [:upper:] : Troca todas as ocorrências do caractere minúsculos por seus respectivos maiúsculos.
- tr ' ' '\t' : Troca o espaço por TAB.

**Comando: cut**

Descrição: O comando "cut" remove caracterres, linhas e colunas.

Principais opções do comando "cut":
- -c[Expressão] : Mostra os caracteres.
- -f["caracter"][Expressão] : Mostra campos.

A parte [Expressão] do comando "cut" pode ser utilizada da s seguintes formas:
- [Posição Inicio] - [Posição Fim] : Mostra os caracteres presentes no intervalo posição incial até a posição final. Para suprimir a posição do caracter inicial, utilize **-c-[Posição Fim]** e para suprimir a indicação da posição final, utilize **-c[Posição Inicio]-** 
- [Posição],[Posição],[Posição] : Mostra os caracteres presentes em cada uma das posições indicadas.
- [Posição],[Posição],[Posição Inicio] - [Posição Fim] : Mostra os caracteres presentes em cada uma das posições indicadas e depois caracteres dentro de um intervalo.

No exemplo abaixo pegamos as posições 1,2 e depois um intervalo da 5 até a 10.
```
edumcosta@vm-ubuntu-l22-h:~$ cat arquivo-elementos.txt | cut -c1,2,5-10
```

**Comando: diff**

Descrição: O comando "diff" compara arquivos e diretórios.

Principais opções do comando "diff":
- w : Apresenta as diferenças, mas suprime que a diferença esteja relacioanda a espaços em branco.
- r : Apresenta as diferenças de arquivos e levando em copnsideração Não sdó o seu nome + também o seu conteúdo.   

**Comando: grep**

Descrição: O comando "grep" procura por uma sequencia de caracteres dentro de um arquivo ou diretório.

Principais opções do comando "grep":
- Texto ou ExpReg : Podem ser utilizadas expressões regulares
- i : Ignora maiúsculas e minúsculas. Aumenta o peso do comando devido as comparações.
- c : Retorna a quantidade de ocorências encontradas na expressão de busca.   
- v : Remove linhas que correspondam a expressão de busca.
- r : Pesquisa expressão de busca em diretórios e de forma recursiva.
- l : Pesquisa em diretórios a expressão de buscae e somente apresenta o nome do arquivo que conteve a expressão de busca.
- -A[Linhas Apresentar] :  A partir da ocorrência da expressão de busca, apresenta o número de linhas subsequentes e conforme indicadas como parâmetro.
- -B[Linhas Apresentar] :  A partir da ocorrência da expressão de busca, apresenta o número de linhas anteriores e conforme indicadas como parâmetro.

No exemplo abaixo está sendo procurada a expressão "Eduardo Martins" no diretório e sub-diretórios "/etc" 
 ```
edumcosta@vm-ubuntu-l22-h:~$ sudo grep "Eduardo Martins" /etc -r
[sudo] password for edumcosta:
/etc/passwd:edumcosta:x:1000:1000:Eduardo Martins da Costa:/home/edumcosta:/bin/bash
/etc/cloud/cloud.cfg.d/99-installer.cfg:      resize_rootfs: false\nssh_pwauth: true\nusers:\n- gecos: Eduardo Martins da\
 ```

 O comando "grep" possui ainda a sua extensão em outros comandos: 
 - fgrep : Não permite a utilização de expressões regulares, comando mais leve. 
 - egrep : Permite a utilização de expressões regulares estendidas.

**Comando: sed**

Descrição: O comando "sed" procura por uma sequencia de caracteres  e substituição de conteúdos. 


| Comando | Descrição |
| --- | --- |
| sed 's/busca/substituicao/' arquivo.txt | Este comando substituirá a primeira ocorrência de "busca" por "substituição" em cada linha do arquivo "arquivo.txt". Se você deseja substituir todas as ocorrências em cada linha, você pode adicionar a opção g no final do comando: sed 's/busca/substituicao/g' arquivo.txt.|
| sed 's/busca/substituicao/' arquivo.txt > novo_arquivo.txt | Este comando realiza a mesma substituição que no exemplo anterior, mas salva o resultado em um novo arquivo chamado "novo_arquivo.txt" em vez de imprimi-lo na tela.|
| sed '/padrao/d' arquivo.txt | Este comando irá excluir todas as linhas que contêm "padrão" especificado no arquivo "arquivo.txt". Você pode usar expressões regulares para fazer correspondências mais complexas.|
| sed -n '5,10p' arquivo.txt | Este comando irá imprimir as linhas de 5 a 10 do arquivo "arquivo.txt". A opção -n é usada para desativar a impressão automática e p é usada para imprimir as linhas selecionadas.|
| sed '1,3 d' arquivo.txt | Deleta da linha 1 a linha 3. |
| sed '/Eduardo/d' arquivo.txt | Procura a expressão Eduardo e se encontrar apaga a linha. |
| sed '/ //g' arquivo.txt | Remove todos os espaços em branco por subsituição. |

Confira todos os detalhes do comando no arquivo : **DominandoSed.pdf**

**Comando: more**

Descrição: O comando "more" mostra o conteúdo em forma de paginação.

Comandos de navegação:
- Tecla Enter : Navega linha a linha. 
- Tecla Espaço : Navega para a próxima página. 

**Comando: less**

Descrição: O comando "less" mostra o conteúdo em forma de paginação.

Comandos de navegação:
- Tecla Enter : Navega linha a linha. 
- Tecla Espaço : Navega para a próxima página. 
- Tecla Setas : Navega entre linhas.
- Tecla q : Sai.

Comandos de pesquisa e navegação:
- /[Expressão] : Procura por uma expressão de cima para baixo.  
- ?[Expressão] : Procura por uma expressão de baixo para cima.  
- Tecla n : Navega para a próxima ocorrência. 
- Tecla N : Navega para a ocorrência anteriror. 


**Comando: find**

Descrição: O comando "find" procura arquivos, diretórios e arquivos. 

$ find [onde começar a pesquisar] [expressão determina o que encontrar] [-opções] [o que encontrar]

| Opções | Descrição |
| ----- | ----- |
| -exec CMD | O arquivo sendo pesquisado que atende aos critérios acima e retorna 0 como seu status de saída para execução bem-sucedida do comando.|
| -ok CMD | Funciona da mesma forma que -exec, exceto que o usuário é solicitado primeiro. | 
| -inum N | Procura por arquivos com número de inode [N corresponde ao inode].|
| -links N | Pesquisa arquivos com links [N corresponde ao link].| 
| -name demo | Pesquise por arquivos que são especificados por "demo".| 
| -iname | Ignora diferença de maiúsculas e miniúsculas. | 
| -newer file | Pesquise por arquivos que foram modificados/criados do arquivo "file".| 
| -perm octal | Procure arquivos com permissão formato "octal".| 
| -user usuário| Procure arquivos pertencentes ao nome de usuário ou ID 'nome'.| 
| -print | Exibe o nome do caminho dos arquivos encontrados usando o restante dos critérios.| 
| -empty | Pesquisa por arquivos e diretórios vazios.| 
| -type | Procura por um tipo de arquivo: |
- f: a regular file
- d: directory
- l: symbolic link
- c: character devices
- b: block devices
- p: named pipe (FIFO)
- s: socket 


Exemplos simples de utilização:
- find /home -name tecmint.txt
- find /home -iname tecmint.txt
- find / -type d -name Tecmint
- find . -type f -perm 0777 -print
- find / -type f ! -perm 777
- find / -user ricardo -name arquivo*

O comando "find" e bastante utilizado com a opção "exec" para a partir de resuultados encontrados, ações sobre esse possam ser executadas como compactar, remover, listar, entre outros.

No exemplo abaixo os arquivos encontrados pelo comando "find" terão os seus detalhes de listagem apresentados. Para isso vamos utiulizar o comando "find" para localizar arquivos com nomes arquivo* e listar o detalhe de cada arquivo com o comando "ls -ltha" que utilizará a expressão "{} \;". O colchetes indica que o retorno do comando find, será passado como arqgumento para o comando "ls" e o caractere "\;" para indicar o fim do comando.   
```
edumcosta@vm-ubuntu-l22-h:~$ find ./ -name 'arquivo*'
./arquivo-elementos.txt
./arquivo-elementos-copia.txt
edumcosta@vm-ubuntu-l22-h:~$ find ./ -name 'arquivo*' -exec ls -ltha {} \;
-rw-rw-r-- 1 edumcosta edumcosta 54 Jun 21 17:27 ./arquivo-elementos.txt
-rw-rw-r-- 1 edumcosta edumcosta 54 Jun 22 18:57 ./arquivo-elementos-copia.txt
```

**Comando: date**

Descrição: O comando "date" apresenta a data do sistema. Ele é muito utilizado para criar formatações em scripts, como log ou comparações.

Exemplo:
- date +%d:%m

| Expressão | Descrição |
| ----- | ----- |
| %% | a literal % |
| %a | locale's abbreviated weekday name (e.g., Sun) |
| %A | locale's full weekday name (e.g., Sunday) |
| %b | locale's abbreviated month name (e.g., Jan) |
| %B | locale's full month name (e.g., January) |
| %c | locale's date and time (e.g., Thu Mar  3 23:05:25 2005) |
| %C | century; like %Y, except omit last two digits (e.g., 20) |
| %d | day of month (e.g., 01) |
| %D | date; same as %m/%d/%y |
| %e | day of month, space padded; same as %_d |
| %F | full date; like %+4Y-%m-%d |
| %g | last two digits of year of ISO week number (see %G) |
| %G | year of ISO week number (see %V); normally useful only with %V |
| %h | same as %b |
| %H | hour (00..23) |
| %I | hour (01..12) |
| %j | day of year (001..366) |
| %k | hour, space padded ( 0..23); same as %_H |
| %l | hour, space padded ( 1..12); same as %_I |
| %m | month (01..12) |
| %M | minute (00..59) |
| %n | a newline |
| %N | nanoseconds (000000000..999999999) |
| %p | locale's equivalent of either AM or PM; blank if not known |
| %P | like %p, but lower case |
| %q | quarter of year (1..4) |
| %r | locale's 12-hour clock time (e.g., 11:11:04 PM) |
| %R | 24-hour hour and minute; same as %H:%M |
| %s | seconds since 1970-01-01 00:00:00 UTC |
| %S | second (00..60) |
| %t | a tab |
| %T | time; same as %H:%M:%S |
| %u | day of week (1..7); 1 is Monday |
| %U | week number of year, with Sunday as first day of week (00..53) |
| %V | ISO week number, with Monday as first day of week (01..53) |
| %w | day of week (0..6); 0 is Sunday |
| %W | week number of year, with Monday as first day of week (00..53) |
| %x | locale's date representation (e.g., 12/31/99) |
| %X | locale's time representation (e.g., 23:13:48) |
| %y | last two digits of year (00..99) |
| %Y | year |
| %z | +hhmm numeric time zone (e.g., -0400) |
| %:z | +hh:mm numeric time zone (e.g., -04:00) |
| %::z | +hh:mm:ss numeric time zone (e.g., -04:00:00) |
| %:::z | numeric time zone with : to necessary precision (e.g., -04, +05:30) |
| %Z | alphabetic time zone abbreviation (e.g., EDT) |

**Comando: seq**

Descrição: O comando "seq" gera uma sequencia numérica.

seq [Inicio / Qtde] [Incremento] [Fim]
- [Início / Qtde] : Número inicial da sequencia quando combinado com um [Fim], senão indica a quantidade de elementos que terão na sequencia e iniciando com o valor 1.
- [Incremento] : Número de incremento da sequencia.
- [Fim] : Número Final da sequencia


**Comando: expr**

Descrição: O comando "expr" realiza expressões aritiméticas.

Opções:
- ARG1 | ARG2    : ARG1 if it is neither null nor 0, otherwise ARG2
- ARG1 & ARG2    : ARG1 if neither argument is null or 0, otherwise 0
- ARG1 < ARG2    : ARG1 is less than ARG2
- ARG1 <= ARG2   : ARG1 is less than or equal to ARG2
- ARG1 = ARG2    : ARG1 is equal to ARG2
- ARG1 != ARG2   : ARG1 is unequal to ARG2
- ARG1 >= ARG2   : ARG1 is greater than or equal to ARG2
- ARG1 > ARG2    : ARG1 is greater than ARG2
- ARG1 + ARG2    : arithmetic sum of ARG1 and ARG2
- ARG1 - ARG2    : arithmetic difference of ARG1 and ARG2
- ARG1 * ARG2    : arithmetic product of ARG1 and ARG2 
- ARG1 / ARG2    : arithmetic quotient of ARG1 divided by ARG2
- ARG1 % ARG2    : arithmetic remainder of ARG1 divided by ARG2

Exemplo:
```
edumcosta@vm-ubuntu-l22-h:~$ expr 5 + 5
10
```
No caso da multiplicação que usa o caracter protegido "*", deve ser utilizado scape "\". 
```
edumcosta@vm-ubuntu-l22-h:~$ expr 5 \* 5
25
```
No caso de divisão não são apresentadas casas decimais. 
```
edumcosta@vm-ubuntu-l22-h:~$ expr 5 / 2
2
```
**Observação:** Para que o comando "expr" funcione, é preciso colocar espaço entre os operadores aritiméticos: expr 1 + 1

**Comando: bc**

Descrição: O comando "bc" realiza expressões aritiméticas repassadas a ele. 

Por padrão ele não vem instalado no Ubuntu.
- sudo apt-get install bc

A forma mais prática para utilizar expressões aritiméticas com o "bc" e não se preocupar com caracteres especiais é escrever a expressão como um texto "(1+1)+(2+2)*2", caso contrário a única coisa diferente do comando "expr" é que não existe a necessidade de se colocar espaço enter os operadores aritiméticos.
```
edumcosta@vm-ubuntu-l22-h:~$ echo "((1+1)+(2+2))*2" |bc
12
```


## Passando Informações Entre Comandos

O caractere "|" (Pipe) é utilizado como um caracter que executa esse tipo de função.

No exemplo abaixo vamos utilizar o comando tail para recuperar a última linha do arquivo e direcionar a saída desse resultado para o comando wc. 
```
edumcosta@vm-ubuntu-l22-h:~$ tail -n1 00-installer-config.bak
  version: 2
edumcosta@vm-ubuntu-l22-h:~$ tail -n1 00-installer-config.bak | wc
      1       2      13
```
Outro Exemplo corresponderia a utilizaçao do comando "sort" + o comando "uniq" para verificar a quantidade de repetições com suas respectivas quantidades e ordenar a saída dessas repetições ordenadas de acordo com a sua quantidade.
```
edumcosta@vm-ubuntu-l22-h:~$ cat arquivo-elementos.txt
elmento1
elmento2
elmento3
elmento2
elmento1
elmento1
edumcosta@vm-ubuntu-l22-h:~$ sort arquivo-elementos.txt | uniq -c | sort
      1 elmento3
      2 elmento2
      3 elmento1
```

## Execução Sequencial de Comandos

O caractere ";" (ponto e vírgula) é utilizado como um caracter separador de comandos: Comando_1; Comando_2; Comando_3 ... 
```
edumcosta@vm-ubuntu-l22-h:~$ echo Comando_1; echo Comando_2; echo Comando_3
Comando_1
Comando_2
Comando_3
```

Os caracteres "&&" (e comercial) é utilizado como um caracter separador de comandos, só que ele somente executará o próximo comando caso o comando anterior tenha sido executado com sucesso: Comando_1 && Comando_2 &&Comando_3 ... 
```
edumcosta@vm-ubuntu-l22-h:~$ echo Comando_1 && echo Comando_2 && echosss Comando_3
Comando_1
Comando_2
-bash: echosss: command not found
```

Os caracteres "||" (Pipes) é utilizado como um caracter separador de comandos, só que ele somente executará o próximo comando caso o comando anterior tenha apresentado um erro na sua execução: Comando_1 || Comando_2 ||Comando_3 ... 
```
edumcosta@vm-ubuntu-l22-h:~$ echoss Comando_1 || echo Comando_2 || echosss Comando_3
-bash: echoss: command not found
Comando_2
```

A execução de comandos entre parênteses **(Comando_1; Comando_2)** executa um comando relacionado a navegação e sem que o diretório corrente de execução seja alterado ao seu final: (cd ..; ls -ltr). Ao término do comando você estará ainda no mesmo diretório, apesar da informação apresentada ser a listagem do diretório anterior.

Após a execução dos comandos paramos no diretório "/home".
```
edumcosta@vm-ubuntu-l22-h:~$ pwd
/home/edumcosta
edumcosta@vm-ubuntu-l22-h:~$ cd .. ; ls -ltr
total 4
drwxr-x--- 7 edumcosta edumcosta 4096 Jun 22 15:57 edumcosta
edumcosta@vm-ubuntu-l22-h:/home$ pwd
/home
```
Após a execução dos comandos paramos no diretório "/home/edumcosta", mesmo diretório de onde os comandos foram executados.
```
edumcosta@vm-ubuntu-l22-h:~$ pwd
/home/edumcosta
edumcosta@vm-ubuntu-l22-h:~$ (cd .. ; ls -ltr)
total 4
drwxr-x--- 7 edumcosta edumcosta 4096 Jun 22 15:57 edumcosta
edumcosta@vm-ubuntu-l22-h:~$ pwd
/home/edumcosta
```

## Redirecionamento de Entrada e Saída

Contexto: 
STDIN(0) : Parâmetro de entrada para um programa.
Programa : Executa uma tarefa.
STDOUT(1) : Resultado execução com sucesso.
STDERR(2) : Resultado execução com erro.

O redirecionamento de entrada e saída corresponde ao redirecionamento dos parâmetros de entrada STDIN(0), como também STDOUT(1) e STDERR(2).

O caractere ">" ou ">>" (maior/maior) é utilizado como um caracter de redirecionamento dos resultados STDOUT(1) e STDERR(2).

Se utilizarmos somente ">" ou "1>", redirecionamos o resultado STDOUT(1) para uma arquivo. Esse arquivo sempre será criado. Caso ele exista, o seu conteúdo é substituído.
- date > data.txt 
- date 1> data.txt

Se utilizarmos ">>" "ou "1>>", redirecionamoso o resultado STDOUT(1) para um arquivo. Esse arquivo somente será criado caso ele não exista e o resultado da saída será anexada ao final do arquivo.
- cat date >> data.txt 
- cat date 1>> data.txt

```
edumcosta@vm-ubuntu-l22-h:~$ date > data.txt
edumcosta@vm-ubuntu-l22-h:~$ cat data.txt
Tue Jun 27 22:37:46 -03 2023
edumcosta@vm-ubuntu-l22-h:~$ date > data.txt
edumcosta@vm-ubuntu-l22-h:~$ cat data.txt
Tue Jun 27 22:38:57 -03 2023
edumcosta@vm-ubuntu-l22-h:~$ date >> data.txt
edumcosta@vm-ubuntu-l22-h:~$ cat data.txt
Tue Jun 27 22:38:57 -03 2023
Tue Jun 27 22:39:50 -03 2023
edumcosta@vm-ubuntu-l22-h:~$
```

Para redirecionarmos de erro, STDERR(2), utilizamos "2>" ou "2>>". A utilização do caractere ">" e a mesma utilizada para STDOUT(1).

```
edumcosta@vm-ubuntu-l22-h:~$ ls -l data.txt.txt 2> log.txt
edumcosta@vm-ubuntu-l22-h:~$ cat log.txt
ls: cannot access 'data.txt.txt': No such file or directory
edumcosta@vm-ubuntu-l22-h:~$
```

Utilizando o redirecionamento para ambas as saídas STDOUT(1) e STDERR(2) em arquivos distintos.
```
edumcosta@vm-ubuntu-l22-h:~$ date 1>> log.txt 2>> log-erro.txt
edumcosta@vm-ubuntu-l22-h:~$ cat log.txt
Tue Jun 27 23:02:02 -03 2023
edumcosta@vm-ubuntu-l22-h:~$ cat log-erro.txt
edumcosta@vm-ubuntu-l22-h:~$ date %i 1>> log.txt 2>> log-erro.txt
edumcosta@vm-ubuntu-l22-h:~$ cat log-erro.txt
date: invalid date ‘%i’
edumcosta@vm-ubuntu-l22-h:~$ cat log.txt
Tue Jun 27 23:02:02 -03 2023
edumcosta@vm-ubuntu-l22-h:~$
```

Para redirecionar ambas as saídas num mesmo arquivo, utilizamos "&1" como referência ao arquivo indicado no parâmetro STDOUT(1).

```
edumcosta@vm-ubuntu-l22-h:~$ date 1>> log.txt 2>&1
edumcosta@vm-ubuntu-l22-h:~$ date 1>> log.txt 2>&1
edumcosta@vm-ubuntu-l22-h:~$ date 1>> log.txt 2>&1
edumcosta@vm-ubuntu-l22-h:~$ date %i 1>> log.txt 2>&1
edumcosta@vm-ubuntu-l22-h:~$ date %i 1>> log.txt 2>&1
edumcosta@vm-ubuntu-l22-h:~$ cat log.txt
Tue Jun 27 23:08:42 -03 2023
Tue Jun 27 23:08:46 -03 2023
Tue Jun 27 23:08:48 -03 2023
date: invalid date ‘%i’
date: invalid date ‘%i’
edumcosta@vm-ubuntu-l22-h:~$
```

As saídas STDOUT(1) e STDERR(2) por padrão são apresentadas na tela, podem ser redirecionadas para arquivos ou podem ser redirecionadas para uma saída nula e que corresponde ao caminho "/dev/null".
No exemplo abaixo não são apresentadas as saídas STDOUT(1) e STDERR(2).
```
edumcosta@vm-ubuntu-l22-h:~$ date %i 2> /dev/null
edumcosta@vm-ubuntu-l22-h:~$ date 1> /dev/null
edumcosta@vm-ubuntu-l22-h:~$
```

Outra forma de redirecionamento corresponde ao caractere "|" (Pipe), que é utilizado como um caracter que executa esse tipo de função.
```
edumcosta@vm-ubuntu-l22-h:~$ tail -n1 00-installer-config.bak
  version: 2
edumcosta@vm-ubuntu-l22-h:~$ tail -n1 00-installer-config.bak | wc
      1       2      13
```

Por padrão O STDIN(0) corresponde ao teclado e o seu redirecionamento é realizada por meio do caractere "<" (menor). A escrita dos comando que trabalham com parâmetros de entrada são realizada de forma diferente.
```
edumcosta@vm-ubuntu-l22-h:~$ cat arquivo-elementos.txt
elmento1
elmento2
elmento3
elmento2
elmento1
elmento1
edumcosta@vm-ubuntu-l22-h:~$ grep elmento1 < arquivo-elementos.txt
elmento1
elmento1
elmento1
edumcosta@vm-ubuntu-l22-h:~$
```

Outra forma seria redirecionar STDOUT(1) como STDIN(0). 
```
edumcosta@vm-ubuntu-l22-h:~$ cat arquivo-elementos.txt |grep elmento1
elmento1
elmento1
elmento1
edumcosta@vm-ubuntu-l22-h:~$
```

## Variáveis de Ambiente

Correspondem a variáveis que são estabelecidas, toda vez que um sessão é iniciada e que definem propriedades do sistema.

As variáveis podem conter valores textos e par de valores:

VAR="Valor"
VAR=Valor
VAR=1
VAR=Valor1:Valor2:...

Para ler o valor contido numa variável do ambiente é utilizado o caractere **"$"**.

```
edumcosta@vm-ubuntu-l22-h:~$ VAR=1
edumcosta@vm-ubuntu-l22-h:~$ echo $VAR
1
```

### Ambiente SHELL.

Principais Variáveis:
- $SHELL : indica o shell que irá interpretar todos os comandos que você digitar. 
- $TERM : especifica o tipo de terminal a ser emulado ao executar o shell.
- $USER : o usuário que está atualmente conectado.
- $PWD : o diretório de trabalho atual.
- $OLDPWD : o diretório de trabalho anterior. Isso é mantido pelo shell para retornar ao seu diretório anterior executando cd -.
- $LS_COLORS : define códigos de cor que são usados para adicionar um resultado de cor opcional ao comando ls. Isso é usado para distinguir diferentes tipos de arquivos e fornecer mais informações ao usuário em um olhar rápido.
- $MAIL : o caminho para a caixa de correio do usuário atual.
- $PATH : uma lista de diretórios que o sistema irá verificar ao procurar por comandos. Quando um usuário digita um comando, o sistema irá verificar diretórios neste pedido para o executável.
- $LANG : a configuração atual de idioma e localização, incluindo a codificação de caracteres.
- $HOME : o diretório base do usuário atual.
- $_ : o comando executado anteriormente mais recente.
- $\$ : corresponde ao valor do bash corrente.
- COLUMNS: o número de colunas de largura que estão sendo usadas para exibir um resultado na tela.
- DIRSTACK: a pilha de diretórios que estão disponíveis com os comandos pushd e popd.
- HISTFILESIZE: número de linhas de histórico de comando armazenadas em um arquivo.
- HISTSIZE: número de linhas de histórico de comando permitidas na memória
- HOSTNAME: o nome de host do computador neste momento.
- SHELLOPTS: opções de shell que podem ser definidas com a opção set.
- UID: o UID do usuário atual.

```
edumcosta@vm-ubuntu-l22-h:~$ VAR=1
edumcosta@vm-ubuntu-l22-h:~$ echo $VAR
1
edumcosta@vm-ubuntu-l22-h:~$ VAR=$$
edumcosta@vm-ubuntu-l22-h:~$ echo $VAR
1466
edumcosta@vm-ubuntu-l22-h:~$ echo $_
1466
edumcosta@vm-ubuntu-l22-h:~$
```

Por meio do comando **"env"** ou **"set"** , podemos acessar as variáveis do ambiente operacional.
- "env" : somente apresenta as variáveis locais
- "set" : apresenta todas as variáveis de ambiente locais e globais.

Parte da saída desses comandos no qual podemos ver algumas variáveis de ambiente.  
```
SHELL=/bin/bash
PWD=/home/edumcosta
LOGNAME=edumcosta
XDG_SESSION_TYPE=tty
MOTD_SHOWN=pam
HOME=/home/edumcosta
LANG=C.UTF-8
```
```
edumcosta@vm-ubuntu-l22-h:~$ echo $XDG_SESSION_TYPE
tty
```

### Ambiente Processos 

Ao criarmos uma variável num sessão doi shell, "bash", temos um processo (PID)em execução no S.O.
As variáveis criadas nesse PID somente estarão visíveis nesse processo e para que outros processo possam enxergar essas variáveis é necessário usar o comando "export": export [variável]. 

Podemos também rebaixar uma variável de global da sessão para local utilizando a opção **"-n"**: export -n [variável]

É importante ressaltar que o comando "export" ou "export -n" deve ser realizado dentro do processo (PID) no qual ela foi criada.

```
edumcosta@vm-ubuntu-l22-h:~$ echo "PID bash : $$"
PID bash : 1466
edumcosta@vm-ubuntu-l22-h:~$ ps |grep bash
   1466 pts/0    00:00:00 bash
edumcosta@vm-ubuntu-l22-h:~$ VAR=1
edumcosta@vm-ubuntu-l22-h:~$ echo $VAR
1
edumcosta@vm-ubuntu-l22-h:~$ bash
edumcosta@vm-ubuntu-l22-h:~$  echo "PID bash : $$"
PID bash : 14869
edumcosta@vm-ubuntu-l22-h:~$  ps |grep bash
   1466 pts/0    00:00:00 bash
  14869 pts/0    00:00:00 bash
edumcosta@vm-ubuntu-l22-h:~$ echo $VAR

edumcosta@vm-ubuntu-l22-h:~$ exit
exit
edumcosta@vm-ubuntu-l22-h:~$ echo "PID bash : $$"
PID bash : 1466
edumcosta@vm-ubuntu-l22-h:~$ export VAR
edumcosta@vm-ubuntu-l22-h:~$ bash
edumcosta@vm-ubuntu-l22-h:~$ echo "PID bash : $$"
PID bash : 14913
edumcosta@vm-ubuntu-l22-h:~$ echo $VAR
1
edumcosta@vm-ubuntu-l22-h:~$ exit
exit
edumcosta@vm-ubuntu-l22-h:~$ echo $VAR
1
edumcosta@vm-ubuntu-l22-h:~$ export -n VAR
edumcosta@vm-ubuntu-l22-h:~$ bash
edumcosta@vm-ubuntu-l22-h:~$ echo $VAR

edumcosta@vm-ubuntu-l22-h:~$
```

### Definindo Variáveis em Arquivos

Se precisar definir variáveis em todo o sistema, pense em adicioná-las ao "/etc/profile", "/etc/bash.bashrc" ou "/etc/environment".

```
login as: edumcosta
edumcosta@192.168.16.10's password:
Welcome to Ubuntu 22.04.2 LTS (GNU/Linux 5.15.0-75-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

This system has been minimized by removing packages and content that are
not required on a system that users do not log into.

To restore this content, you can run the 'unminimize' command.
Last login: Thu Jun 29 22:26:33 2023 from 192.168.16.1
edumcosta@vm-ubuntu-l22-h:~$ cat /etc/environment
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
SELO="SELO UBUNTU"

edumcosta@vm-ubuntu-l22-h:~$ echo $SELO
SELO UBUNTU
edumcosta@vm-ubuntu-l22-h:~$
```

### Resultado de Comandos em Variáveis

Para passarmos o resultado de um comando para uma variável podemos utilizar: - Utilizando o caractere **"\`"** (Crase) delimitando o comando: HORA=\`date +%H\`
- Utilizando a sintaxe $(comando): hora=$(date +%H)

```
edumcosta@vm-ubuntu-l22-h:~$ HORA=`date +%H`
edumcosta@vm-ubuntu-l22-h:~$ echo $HORA
23
edumcosta@vm-ubuntu-l22-h:~$ HORA=$(date +%H)
edumcosta@vm-ubuntu-l22-h:~$ echo $HORA
23
edumcosta@vm-ubuntu-l22-h:~$
```

## Protegendo os Caracteres Especiais do Shell

As áspas duplas ("") ou simples ('') ou a barra invertida (\) são utilizadas para proteger os caracterers especiais do bash fazendo com que ele não os interprete.
```
edumcosta@vm-ubuntu-l22-h:~$ echo *
00-installer-config.bak Docker arquivo-elementos-copia.txt arquivo-elementos.txt data.txt log.txt
edumcosta@vm-ubuntu-l22-h:~$ echo "*"
*
edumcosta@vm-ubuntu-l22-h:~$ echo '*'
*
edumcosta@vm-ubuntu-l22-h:~$ echo \*
*
edumcosta@vm-ubuntu-l22-h:~$
```
As áspas duplas ("") protegem todos os caracteres exceto: 
- $ 
- `
- / 
As áspas simples ('') protege todos os caracteres.

## Editor "vi" Prático

Modo Navegação:
- CRTL + F : pagina para baixo. 
- CRTL + B : pagina para cima.

Modo de Inserção:
- i : Entra em modo de inserção.

Modo de Comando:
- : : Entra em modo de comando
- :Número : Vai para a linha.
- :$ : Vai para a última linha.
- :! : Executa um comando no bash.

Modo de Busca:
- /Palavra : Busca a palavra de cima para baixo.
- n : Navega para a próxima ocorrência.
- N : Navega para a ocorrência anteriro.
- ?Palavra : Busca a palavra de baixo para cima.

Modo de Remover / Copiar / Colar:
- dd : Recorta uma linha.
- d[número]d : Recorta um número de linhas.
- p : Cola o conteúdo da área de transferência.
- yy : Copia uma linha. 
- y[número]y : Copia número de linhas.


## Expressões Regulares: File Globbing e REGEX

**File Globbing:** Recupera arquivos a partir de expressões regulares.
| Principais | Descrição |
| --- | --- |
| * | Representa qualquer caracter depois.|
| | **Exemplo:** ls arquivo* : Qualquer outra palavra que comece com "arquivo" e que depois possua qualquer outros caracteres.|
| [caracteres] | Representa caracteres ou intervalos de caracteres. |
| | **Exemplo:** ls arquivo[12345] : Recupera dos os arquivos que comencem com "arquivo" e que o próximo caracter seja, 1 ou 2 ou 3 ou 4 ou 5.|
| | **Exemplo:** ls arquivo[12]* : Recupera dos os arquivos que comencem com "arquivo" e que o próximo caracter seja, 1 ou 2 e depois seja qualquer outro caracter.|
| | **Exemplo:** ls *[12]* : Recupera qualquer arquivo que termine com 1 ou 2.|
| {caracteres} | Representa caracteres e diferentemente do colchetes, não corresponde a um intervalo de caracteres. O resultado da saída desse comando pode ser tanto um STDOUT como um STDERR  |
| | **Exemplo:** ls {t,T}[12] : Recupera os arquivos que começam com "t" ou "T" e que o próximo caracter seja, 1 ou 2.|
| ? | Indica a presença de caracteres ou seja, deve existir e conforme a quantidade de "?".|
| | **Exemplo:** ls t?? : Recupera qualquer arquivo que começe com "t" e possua qualquer outros dois caractertes depois.| 

Exemplos:
```
edumcosta@vm-ubuntu-l22-h:~$ ls t[12][a-z,A-Z][1-6]
t1A1  t1A2  t1A3  t1A4  t1a1
edumcosta@vm-ubuntu-l22-h:~$
```
Abaixo vemos a utilização de chaves e com retorno de STDOUT e STDERR, no qual a expressão "t" pode ser encontrada e a expressão "T" não pode ser encontrada.
```
edumcosta@vm-ubuntu-l22-h:~$ ls {t,T}[12]
ls: cannot access 'T[12]': No such file or directory
 t1   t2
edumcosta@vm-ubuntu-l22-h:~$
```
```
edumcosta@vm-ubuntu-l22-h:~$ ls t?
t1  t2
edumcosta@vm-ubuntu-l22-h:~$ ls t??
t1a
edumcosta@vm-ubuntu-l22-h:~$ ls t???
t121  t1A1  t1A2  t1A3  t1A4  t1a1
edumcosta@vm-ubuntu-l22-h:~$
```

**REGEX:** Recupera um padrão de texto a partir de expressões regulares.

| Principais | Descrição |
| --- | --- |
| * | Representa qualquer caracter depois ou o caracter anterior também pode não existir.|
| | **Exemplo:** egrep b[a,b]g* texto.txt: Qualquer palavra que comece com "b", o segundo caracter, seja "a" ou "b" e o terceiro caracter seja "g" ou não e que depois possua qualquer outros caracteres.|
| + | Representa qualquer caracter depois e o caracter anterior deve existir.|
| | **Exemplo:** egrep b[a,b]g+ texto.txt: Qualquer palavra que comece com "b", o segundo caracter, seja "a" ou "b" e o terceiro caracter seja "g" e que depois possua qualquer outros caracteres.|
| ^ | Referencia como critério o primeiro caracter.|
| | **Exemplo:** egrep "^Linux" texto.txt : Recupera a palavra "Linux" que esteja presente no início de uma linha.| 
| $ | Referencia como critério o primeiro caracter.|
| | **Exemplo:** egrep "Linux$" texto.txt : Recupera a palavra "Linux" que esteja presente no fim de uma linha.| 
| ? | Representa qualquer caracter depois ou o caracter anterior também pode não existir e se existir deve ser só uma vez.|
| | **Exemplo:** egrep b[a,b]g? texto.txt: Qualquer palavra que comece com 
"b", o segundo caracter, seja "a" ou "b" e o terceiro caracter seja "g" ou não, mas se existir deve ocorrer somente uma vez.| 
| . | Representa qualquer caracter depois e depois outra sequencia de caracter e deve existir e conforme a quantidade de "."|
| | **Exemplo:** egrep "O.Linux" texto.txt* : Recupera a palavra que comece com "O" e depois seja qualquer caracter e depois seja a palavra "Linux".|
| | **Exemplo:** egrep "O..Linux" texto.txt* : Recupera a palavra que comece com "O" e depois sejam outros dois caracteres e depois seja a palavra "Linux".|


| [caracteres] | Representa caracteres ou intervalos de caracteres. |
| | **Exemplo:** egrep "b[aei]g" texto.txt : Recupera a palavra que comece com "b" e que o próximo caracter seja, a ou e ou i.|
| | **Exemplo:** egrep "b[a-o]*" texto.txt* : Recupera a palavra que comece com "b" e que o próximo caracter esteja no intervalo de "a-o" e que depois possa ser qualquer outro caracter.|


```
edumcosta@vm-ubuntu-l22-h:~$ egrep Linux texto.txt
Linux
LinuxUbuntu
Linux Ubuntu
O Sistema Operacional Linux
O Linux
Origem Linux
OLinux
```
```
edumcosta@vm-ubuntu-l22-h:~$ egrep "[lL]inux" texto.txt
Linux
LinuxUbuntu
Linux Ubuntu
O Sistema Operacional Linux
O Linux
Origem Linux
OLinux
server.linux.com
```
```
edumcosta@vm-ubuntu-l22-h:~$ egrep "b[aei]g" texto.txt
bag
beg
big
beginner
bigger
bege
edumcosta@vm-ubuntu-l22-h:~$ egrep "b[a-o]g" texto.txt
bag
bbg
beg
big
bog
beginner
bigger
bege
edumcosta@vm-ubuntu-l22-h:~$ egrep "b[a-e]g" texto.txt
bag
bbg
beg
beginner
bege
edumcosta@vm-ubuntu-l22-h:~$
```
```
edumcosta@vm-ubuntu-l22-h:~$ egrep "^Linux" texto.txt
Linux
LinuxUbuntu
Linux Ubuntu
edumcosta@vm-ubuntu-l22-h:~$ egrep "Linux$" texto.txt
Linux
O Sistema Operacional Linux
O Linux
Origem Linux
OLinux
edumcosta@vm-ubuntu-l22-h:~$
```
Exemplo pegando todas as linhas de um arquivo e que estão em branco.
```
edumcosta@vm-ubuntu-l22-h:~$ egrep "^$" texto.txt


edumcosta@vm-ubuntu-l22-h:~$
```
Exemplo pegando todas as linhas de um arquivo sem mostrar as em branco. Nese caso todas as linhas foram apresentadas e que não estavam em branco devido a aopção "-v".
```
edumcosta@vm-ubuntu-l22-h:~$ egrep -v "^$" texto.txt
# Arquivo de exemplo para expressao regular
O Xubuntu é baseado no Ubuntu
Linux
LinuxUbuntu
Linux Ubuntu
O Sistema Operacional Linux
O Linux
Origem Linux
OLinux
# isso é um comentário
bag
bbg
beg
big
bog
bug
beginner
bigger
bugzilla
bege
server.linux.com
edumcosta@vm-ubuntu-l22-h:~$
```
```
edumcosta@vm-ubuntu-l22-h:~$ egrep "O.Linux" texto.txt
O Linux
edumcosta@vm-ubuntu-l22-h:~$ egrep "O..Linux" texto.txt
edumcosta@vm-ubuntu-l22-h:~$ egrep "O.+Linux" texto.txt
O Sistema Operacional Linux
O Linux
Origem Linux
edumcosta@vm-ubuntu-l22-h:~$ egrep "O.*Linux" texto.txt
O Sistema Operacional Linux
O Linux
Origem Linux
OLinux
edumcosta@vm-ubuntu-l22-h:~$
```
**Observação:** A barra invertida server para proteger a interpretação de caracteres especiais do bash. Para o exemplo acima, para pesquisar pelo caracteres ".", ele deve ser protegido.
```
edumcosta@vm-ubuntu-l22-h:~$ egrep "[l,L]inux\." texto.txt
server.linux.com
edumcosta@vm-ubuntu-l22-h:~$
```

## Permissões sobre Arquivos e Diretórios

Sempre que um script é criado, deve-se mudar a sua permissão para execução.

Na saída de "ls -l", as permissões de arquivo são mostradas logo após o tipo de arquivo, como três grupos de três caracteres cada, na ordem r, w e x e o traço "-" representa a falta de permissão.
- O primeiro caractere, indica o tipo de arquivo.
- Os três caracteres seguintes, indicam as permissõe do proprietário do arquivo, também chamado de usuário ou "u".
- Os três caracteres seguintes, indicam as permissões do grupo que possui o arquivo, também chamado de "g".
- Os três últimos caracteres, indicam as permissões de todos os outros ou "o".

```
edumcosta@vm-ubuntu-l22-h:~$ ls -lh
total 28K
-rw-r--r-- 1 edumcosta edumcosta  115 Jul 10  2022 00-installer-config.bak
drwxrwxr-x 6 edumcosta edumcosta 4.0K May 29 14:43 Docker
edumcosta@vm-ubuntu-l22-h:~$
```

**Permissões em Arquivos:**
| Caracter | Descrição |
| --- | --- |
| r | Significa read (leitura) e tem um valor octal de 4 (não se preocupe, falaremos de octais em breve). Indica permissão para abrir um arquivo e ler seu conteúdo.|
| w | Significa write (escrita) e tem um valor octal de 2. Indica permissão para editar ou excluir um arquivo.|
| x | Significa execute (execução) e tem um valor octal de 1. Indica que o arquivo pode ser executado como um executável ou script.|

Assim, por exemplo, um arquivo com permissões rw- pode ser lido e escrito, mas não pode ser executado.

**Permissões em Diretórios:**
| Caracter | Descrição |
| --- | --- |
| r | Significa read (leitura) e tem um valor octal de 4. Indica permissão para ler o conteúdo do diretório, como nomes de arquivos. Mas não implica em permissão para ler os arquivos em si.|
| w | Significa write (escrita) e tem um valor octal de 2. Indica permissão para editar ou excluir arquivos em um diretório, ou alterar seus nomes, permissões e proprietários.|
| x | Significa execute (execução) e tem um valor octal de 1. Indica permissão para entrar em um diretório, mas não para listar seus arquivos (para isso, r é necessário).|


**Modificando as Permissões de Arquivos**

O comando chmod é usado para modificar as permissões de um arquivo e pede pelo menos dois parâmetros: 
- Primeiro : Descreve quais permissões alterar.
  - Para informar mais de uma permissão separe elas pelo caracter ",".
- Segundo: Aponta para o arquivo ou diretório onde a alteração será feita. 

**Modo Simbólico**

O(s) primeiro(s) caractere(s) indica(m) para quem as permissões serão atribuídas:
- u : alteração do usuário.
- g : grupo de usuário. 
- o : outros. 
- a : todos.

Após a indicação de para quem as permissões serão atribuídas é indicada a ação: 
- + : Conceder uma permissão. 
- - : Revogar uma permissão. 
- = : defini-la com um valor específico.

Após indicada a ação é indicada a permissão: 
- r : leitura.
- w : escrita.
- x : execução

Para o exemplo abaixo está sendo concedida a permissão de execução para o usuário proprietário do arquivo e removendo para o grupo a permissão de de escrita, alteração.
```
$ chmod u+x,g-w text.txt
```
Altera de forma recursiva caso indicado um diretório.
```
$ chmod -R u+x,g-w meu_diretorio
```

**Observação:** Para modificar o proprietário de um arquivo ou diretório, utilize o comando **"chown"**: chown USERNAME:GROUPNAME FILENAME


## A Variável de Ambiente PATH

A váriável de ambiente "PATH" indica os diretórios no qual o S.O irá buscar informações da existência de uma arquivo com o nome informado no bash. 
Caso o diretório não esteja na variável PATH, é necessário indicar o caminho do arquivo. 
```
edumcosta@vm-ubuntu-l22-h:~$ ./bomdia.sh
edumcosta@vm-ubuntu-l22-h:~$ Bom dia!
```

A váriável de ambiente "PATH"
```
edumcosta@vm-ubuntu-l22-h:~$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
edumcosta@vm-ubuntu-l22-h:~$
```
O valor da variável "PATH" pode ser alterada e persistida somente para a seção corrente do usuário ou para todas as seções iniciadas pelo usuário.

Para alterar sem persistir definitivamente alteramos somente o seu valor.
```
edumcosta@vm-ubuntu-l22-h:~$ PATH="$PATH:/home/edumcosta"
edumcosta@vm-ubuntu-l22-h:~$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/edumcosta
edumcosta@vm-ubuntu-l22-h:~$
```
Para alterar de forma persistida e definitivamente alteramos o arquivo "~/.profile" para indicar novos caminhos.

## Scripts Shell

As boas práticas para scripts é utilizar arquivos sem espaços, com documentação e extensão ".sh".

```
# O caracter "#" é utilizado para comentar linhas.
# Conforme abaixo é realizada a documentação de que deve ser utilizado o bash como interpretador. 
#!/bim/bash  
# Limpa a tela 
clear
echo "**** Meu primeiro Script Shell ****"\n
```

## Códigos de Saída

Representam o resultado da execução de um script.

| Valor | Descrição |
| --- | --- |
| 0 | Sucesso. |
| 1-255 | Representa um insucesso.|

O comando "$?" retorna o resultado de saída obtido no último programa. Em algumas documentações "man" indicam os códigos de saídas implementados.
```
edumcosta@vm-ubuntu-l22-h:~$ date
Fri Jul  7 15:38:48 -03 2023
edumcosta@vm-ubuntu-l22-h:~$ echo "$?"
0
edumcosta@vm-ubuntu-l22-h:~$ date %
date: invalid date ‘%’
edumcosta@vm-ubuntu-l22-h:~$ echo "$?"
1
edumcosta@vm-ubuntu-l22-h:~$
```
Dentro de um script podemos utilizamos o comando "exit" para interromper a execução, podemos informar um código de saída e qualquer linha abaixo desse comando não será executada.

No exemplo abaixo o valor de RETURN_CODE será 2 (erro) e na saída do programa será propagado o valor de RETURN_CODE. 
```
#!/bin/bash
ls -ltha /home/diretorio_não_existe
RETURN_CODE=$?
echo "Codigo de retorno: $RETURN_CODE"
EXIT $RETURN_CODE 
```

## Entradas de Informações

### Comando "read"

O comando "read" recebe entrada de dados a partir da digitação no bash e possui várias opções "--help".

| Opção | Descrição |
| --- | --- |
| -p |  Permite indicar um texto "Meu texto" e disponibiliza prompt para a entrada de dados.|
| -s | Disponibiliza prompt para a entrada de dados sem a apresentação dos caracteres digitados.|

```
edumcosta@vm-ubuntu-l22-h:~$ read -p "Informe seu nome?" NOME
Informe seu nome?Eduardo
edumcosta@vm-ubuntu-l22-h:~$ echo $NOME
Eduardo
edumcosta@vm-ubuntu-l22-h:~$
```
No exemplo abaixo combinamos ambos os tipos de entrada, mas para dar um feito de quebra de linha, adicionamos o comando "echo" que terá função de quebrar a linha após a execução do comando "read" 
```
edumcosta@vm-ubuntu-l22-h:~$ read -p "Informe sua senha?" -s SENHA ; echo -e "\n"
Informe sua senha?

edumcosta@vm-ubuntu-l22-h:~$ echo $SENHA
minhasenha
```
Exemplo de read num script:
```
#!/bin/bash

#########################################################################
# 									#
# BuscaAluno.sh - Procurar nome completo do aluno			#
#									#
# Autor: Ricardo Prudenciato (ricardo@linuxsemfronteiras.com.br)	#
# Data Criação: DD/MM/YYYY						#
#									#
# Descrição: Script de exemplo para o comando read. 			#
#	     A partir de uma entrada do usuário, será feita uma		#
#	     busca no arquivo alunos2.txt				#
#									#
# Exemplo de uso: ./BuscaAlunos.sh					#
#									#
#########################################################################

ARQALUNOS="/home/ricardo/Cursos/ShellScript/arquivos/alunos2.txt"

clear
echo "======= Script de Busca de Alunos ========"
echo ""
#echo -n "Por favor, informe o nome do aluno: "
#read ALUNO
read -p "Por favor, informe o nome do aluno: " ALUNO

ALUNOCOMPLETO=$(grep "$ALUNO" $ARQALUNOS)

echo ""
echo "O nome completo do aluno é: $ALUNOCOMPLETO"
echo ""
echo "Fim do Script"
```

### Parâmetros

As variáveis relacionadas a parâmetros de entrada:
- $0 : Nome do Programa
- $# : Quantidade de Parâmetros
- $* : Todos os parâmetros inseridos
- $1-N : Cada um dos parâmetros e limitados a N

Exemplo de parâmetros:
```
#!/bin/bash

# $0 - Nome do Programa
# $# - Quantidade de Parâmetros
# $* - Todos os parâmetros inseridos
# $1-4 - Cada um dos parâmetros e limitados a 4

echo "O script $0 recebeu $# parâmetros"

echo "Os parâmetros recebidos foram: $*"

echo ""
echo "Parâmetro \$1 = $1"
echo "Parâmetro \$2 = $2"
echo "Parâmetro \$3 = $3"
echo "Parâmetro \$4 = $4"
```

## Instruções Condicionais

### IF / ELSE

Sintaxe:
```
if [comando + condição]
then
  [comando 1]
else
  [comando 2}
fi
```
Para realizar os testes de condição, utilizamos o comando "test" e a condição. A palavra test pode ser representada entre colchetes.
- 0 : Verdadeiro.
- 1 : Falso.

Condições numéricas:
- -eq : Igual.
- -ne : Diferente.
- -gt : Maior que.
- -ge : Maior ou igual que.
- -lt : Menor que.
- -le : Menor ou igual que.

Condições texto:
- = : Igual.
- != : Diferente.
- != : Diferente.
- -n : Não Nula.
- -z : Nula

Condições Arquivos:
- -f : É um arquivo.
- -d : É um diretório.
- -r : Tem permissão de leitura.
- -w : Tem permissão de escrita.
- -x : Tem permissão de execução.
- -s : Possui tamanho maior que zero.

```
edumcosta@vm-ubuntu-l22-h:~$ test A = B
edumcosta@vm-ubuntu-l22-h:~$ echo $?
0
edumcosta@vm-ubuntu-l22-h:~$
```
```
if test A = A
then
  comando 1
else
  comando 2
fi
```
Ou 
```
if [A = A]
then
  comando 1
else
  # Aqui utuilizada a negação com a representação de colchetes.
  if [! A = A];
  then
    comando 2
  fi
fi
```

## Instruções Boleanas

Utilzadas em expressões compostas.
- -a : AND
- -o : OU

```
if [A = A -o A = B] 
then
  comando 1
fi
```

### CASE

Sintaxe:
```
case [Variável] in
  critério 1)
    [comando 1]
  ;;
  critério 2)
    [comando 2]
  ;;
  # Nenhum dos critério anteriores. 
  *)
    [comando 3]
  ;;
esac
```
Os conjuntos de caracteres:
- ) : Caracter de fechamento de um critério.
- ;; : Delimita o fechamento de um critério.
- * : Nenhum dos critério anterirores.

Os critérios podem ser representados por expressões regulares.
```
case $1 in
  [0-9])
    echo "O caracter informado é um número".
  ;;
  [a-z,A-Z])
    echo "O caracter informado é uma letra".
  ;;
esac
```



### FOR

Sintaxe:
```
for VARIAVEL in VALOR 1 VALOR 2 ,,, VALOR N
do
  [comando1]
  [comando2]
  ...
done
```
Variações para VALOR no FOR:
| Sintaxe | Descrição |
| --- | --- |
| for VARIAVEL in 1 2 3 4 5 | Executa 5 vezes.|
| for VARIAVEL in a b c d e | Executa 5 vezes.|
| for VARIAVEL in {1..5} | Executa de 1 a 5.|
| for VARIAVEL in {1..10..2} | Executa de 1 a 10 incrementado de 2.|
| for VARIAVEL in arquivo* | Utiliza File Globbing, executa para todos os arquivos que comecem com "aluno".|
| for VARIAVEL in $(seq 1 5) | Utiliza o comando "seq" e executa de 1 a 5.|
| for VARIAVEL in $(seq 1 2 10) | Utiliza o comando "seq" e executa de 1 a 10 incrementado de 2.|
| for VARIAVEL in $(cat alunos.txt) | Utiliza o comando "cat" e para cada caracter dentro do arquivo, será atribuído a VARIAVEL.|
| for ((ATUAL=0; ATUAL<10; ATUAL++))| Escrita padrão C, executa de 0 a 9 incrementando de 1.|
| for ((ATUAL=0; ATUAL<10; ATUAL+2))| Escrita padrão C, executa de 0 a 9 incrementando de 2.|

### WHILE

Executa enquanto a condição for verdadeira ou um comando retorna resultado.

Sintaxe:
```
while <comando-condição>
do
  [comando1]
  [comando2]
  ...
done
```
No exemplo abaixo, vamos utilizar o comando "test", representado por ["condiçao"] e # vamos utilizar o comando "expr" para incrementar o valor de x.   
```
x=1
while [$x -le 20]
do
  echo "O valor atual é : $x"  
  x=$(expr $x + 1)
  ...
done
```
Nesse próximo exemplo, vamos utilizar o comando test, representado por ["comando"].
- O comando "ps", retorna os processos do kernell. 
- O caractere "|" (Pipe) redireciona a saída para o comando "wc".
- O comando "wc", conta a quantidade de saídas do comando "ps".
- O loop se executará enquanto essa quantidade for menor que 300.
- Se verdadeiro, será executado o "echo" e o programa adormece por 30 segundos. 

```
while [$(ps axu | wc -l) -lt 300]
do
  echo "Tudo OK"
  sleep 30
  ...
done
```
No próximo exemplo, vamos utilizar o comando "ls" sem testar uma condição com o comando "test". Para esse exemplo o loop será finalizado a partir de erro de execução retornado pelo comando "ls", a partir da não existência do arquivo.
```
# O redirecionamento da saída para "dev/null" evita que o resultado de "ls" seja direcionado para a tela.
while ls /var/lock/processo.lock > /dev/null
do
  echo "Processo em execução."
  sleep 30
  ...
done
```

### Until

Sintaxe:
```
until <comando-condição>
do
  [comando1]
  [comando2]
  ...
done
```
Diferentemente do "while", o "until" executa até que a condição seja verdadeira ou até que um comando retorne um resultado.

Conforme o exemplo anteriror, o script com "while" que verificava a presença de um arquivo, com "uutil", podemos fazer um script para parar de executar quando um arquivo tiver sido criado. O redirecionamento da saída para "dev/null" evita que o resultado de "ls" seja direcionado para a tela e nesse caso estamos redirecionado o erro. 
```
until ls /var/lock/processo.lock 2> /dev/null
do
  echo "Aguardando Processo..."
  sleep 30
  ...
done
```
Outro exemplo é verificar se um programa está em execução.
- "grep -v grep" é utilizado para remover a própria linha retornada pelo grep em função dele ter sido executado. 
```
until ps aux | grep firefox| grep -v grep > /dev/null
do
  echo "Inicie o firefox ..."
  sleep 5
  echo 
  ...
done
echo "Firefox iniciado."
echo PID: $(pgrep firefox)
```

### Interrupção de Loops - "break" e "continue"

**break** : Quando utilizado dentro de "do" / "done", a próxima linha que será executada será a instrução após o "done".

**continue** : Quando utilizado dentro de "do" / "done", a próxima linha que será executada será a condição do loop "while", "until" ou "for".


## IFS - Internal Filed Separator

O IFS é uma variável de ambiente do bash que indica o quais caracteres são considerados como separadores de campos.

Por padrão o IFS considera os seguintes caracteres como separadores:
- Espaço
- TAB
- Quebra de Linha

```
edumcosta@vm-ubuntu-l22-h:~$ set |grep IFS
IFS=$' \t\n'
_=IFS
    test -r "$1" && IFS='
    local ifs=$IFS IFS=: dir cmd="${1##*/}" compfile;
    IFS=$ifs;
    local option option2 i IFS='
    IFS='
        local IFS='
        local IFS='
        local IFS='
        local IFS='
    local IFS='
        local IFS='
    local IFS='
        IFS=' ';
        IFS='
        IFS=' ';
        IFS='
            IFS=' ';
            IFS='
    local IFS='
        IFS=' ';
        IFS='
    local configfile flag prefix="" ifs=$IFS;
        local IFS='
        IFS=$ifs;
                    local IFS=,;
                    IFS=$ifs;
        local line i=-1 ifs=$IFS;
        IFS='
        IFS=$ifs;
    local IFS='
                local IFS='
                    local IFS='
                    local IFS='
            local IFS='
        local IFS='
edumcosta@vm-ubuntu-l22-h:~$
```
Caso a necessidade como por exemplo ler o arquivo "/etc/passwd", no qual os campos são separados por ":". 
Para isso crie um variável que receba a configuração padrão do IFS como backup e depois retorne o backup para a variavel de IFS e retornar ao padrão.
```
edumcosta@vm-ubuntu-l22-h:~$ TEMP_IFS=$IFS
edumcosta@vm-ubuntu-l22-h:~$ set |grep IFS
IFS=$' \t\n'
TEMP_IFS=$' \t\n'
    test -r "$1" && IFS='
    local ifs=$IFS IFS=: dir cmd="${1##*/}" compfile;
    IFS=$ifs;
    local option option2 i IFS='
    IFS='
        local IFS='
        local IFS='
        local IFS='
        local IFS='
    local IFS='
        local IFS='
    local IFS='
        IFS=' ';
        IFS='
        IFS=' ';
        IFS='
            IFS=' ';
            IFS='
    local IFS='
        IFS=' ';
        IFS='
    local configfile flag prefix="" ifs=$IFS;
        local IFS='
        IFS=$ifs;
                    local IFS=,;
                    IFS=$ifs;
        local line i=-1 ifs=$IFS;
        IFS='
        IFS=$ifs;
    local IFS='
                local IFS='
                    local IFS='
                    local IFS='
            local IFS='
        local IFS='
edumcosta@vm-ubuntu-l22-h:~$ IFS=:
edumcosta@vm-ubuntu-l22-h:~$ set |grep IFS
IFS=:
TEMP_IFS=$' \t\n'
    test -r "$1" && IFS='
    local ifs=$IFS IFS=: dir cmd="${1##*/}" compfile;
    IFS=$ifs;
    local option option2 i IFS='
    IFS='
        local IFS='
        local IFS='
        local IFS='
        local IFS='
    local IFS='
        local IFS='
    local IFS='
        IFS=' ';
        IFS='
        IFS=' ';
        IFS='
            IFS=' ';
            IFS='
    local IFS='
        IFS=' ';
        IFS='
    local configfile flag prefix="" ifs=$IFS;
        local IFS='
        IFS=$ifs;
                    local IFS=,;
                    IFS=$ifs;
        local line i=-1 ifs=$IFS;
        IFS='
        IFS=$ifs;
    local IFS='
                local IFS='
                    local IFS='
                    local IFS='
            local IFS='
        local IFS='
```
Retorna para o padrão.
```
edumcosta@vm-ubuntu-l22-h:~$ IFS=$TEMP_IFS
edumcosta@vm-ubuntu-l22-h:~$
```

# Proteger Script - Shell script compiler

https://manpages.ubuntu.com/manpages/jammy/man1/shc.1.html

sudo apt install gcc
sudo apt-get install shc

shc -f myscript -o mybinary
shc -f script-mysql-config-docker.sh