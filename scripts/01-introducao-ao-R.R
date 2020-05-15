# INTRODUÇÃO AO R

# Rodando códigos (o R como calculadora) ----------------------------------

# ATALHO para rodar o código: CTRL + ENTER

# adição
1 + 1

# subtração
4 - 2

# multiplicação
2 * 3

# divisão
5 / 3

# potência
4 ^ 2

# Criando objetos/variáveis -----------------------------------------------

# Salvando o valor 1 no objeto "obj"
obj <- 1
obj

# Também dizemos 'guardando as saídas'
soma <- 2 + 2
soma

# ATALHO para a <- : ALT - (alt menos)

# O R difencia minúscula de maiúscula!

a <- 5
A <- 42

a
A

# Os nomes devem começar com uma letra. 
# Podem conter letras, números, _ e .

# Permitido

x <- 1
x1 <- 2
objeto <- 3
meu_objeto <- 4
meu.objeto <- 5

# Não permitido

1x <- 1
_objeto <- 2
meu-objeto <- 3

# Estilo de nomes

eu_uso_snake_case
outrasPessoasUsamCamelCase
algumas.pessoas.usam.pontos
E_algumasPoucas.Pessoas_RENUNCIAMconvenções

# Exercícios --------------------------------------------------------------

# 1. Linhas que começam com # são comentários. Elas são ignoradas na hora
# de avaliar o código. Coloque o cursor em cima de um comentário, pressione
# CTRL + ENTER e tente entender qual operação o RStudio realizou no Console.

# 2. Multiplique a sua idade por 12 e salve em um objeto chamado "meses".


# Data frames -------------------------------------------------------------

mtcars

# Classes -----------------------------------------------------------------

# Podemos somar dois números
1 + 2

# Não podemos somar duas letras (texto)
"a" + "b"

##############################
# Use aspas para criar texto #
##############################

a <- 10

# O objeto a, sem aspas
a

# A letra (texto) a, com aspas
"a"

# Numéricos (numeric)

a <- 10
class(a)

# Caracteres (character, strings)

obj <- "a"
obj2 <- "masculino"

class(obj)
class(obs2)

# lógicos (logical, booleanos)

verdadeiro <- TRUE
falso <- FALSE

class(verdadeiro)
class(falso)

# Data frames

mtcars
class(mtcars)

# Vetores -----------------------------------------------------------------

# Vetores são conjuntos indexado de valores

vetor1 <- c(1, 4, 3, 10)
vetor2 <- c("a", "b", "z")

vetor1
vetor2

# Uma maneira fácil de criar um vetor com uma sequência de números 
# é utilizar o operador `:`

# Vetor de 1 a 10
1:10

# Vetor de 10 a 1
10:1

# Vetor de -3 a 3
-3:3

# Quando dizemos que vetores são conjuntos indexados, 
# isso quer dizer que cada valor dentro de um vetor tem uma posição

vetor <- c("a", "b", "c", "d")

vetor[1]
vetor[2]
vetor[3]
vetor[4]

vetor[c(2, 3)]
vetor[c(1, 2, 4)]

vetor[5]

# Um vetor só pode guardar um tipo de objeto e ele terá sempre 
# a mesma classe dos objetos que guarda

vetor1 <- c(1, 5, 3, -10)
vetor2 <- c("a", "b", "c")

class(vetor1)
class(vetor2)

# Se tentarmos misturar duas classes, o R vai apresentar o 
# comportamento conhecido como coerção

vetor <- c(1, 2, "a")

vetor
class(vetor)

# Naturalmente, podemos fazer operações matemáticas com vetores

vetor <- c(0, 5, 20, -3)

vetor + 1
vetor - 1
vetor / 2
vetor * 10

# Você também pode fazer operações que envolvem mais de um vetor:

vetor1 <- c(1, 2, 3)
vetor2 <- c(10, 20, 30)

vetor1  + vetor2

# As coisas ficam um pouco confusas quando os dois 
# vetores não tem o mesmo tamanho

vetor1 <- c(1, 2)
vetor2 <- c(10, 20, 30, 40)

# Esse comportamento é chamado de reciclagem.

# As coisas ficam um pouco mais confusas quando os comprimentos
# dos vetores não são múltiplos

vetor1 <- c(1, 2, 3)
vetor2 <- c(10, 20, 30, 40, 50)

vetor1 + vetor2

# Exercícios --------------------------------------------------------------

# a. Guarde em um objeto uma sequência de números que comece 
# em 0 e termine em 5.

# b. Use subsetting para fazer o R devolver o primeiro número dessa sequência.
# Em seguida, faça o R devolver o último número da sequência.

# c. Multiplique todos os valores do seu vetor por -1. Guarde o resultado em
# um novo objeto.

# Comparações lógicas ------------------------------------------------------

# Valores lógicos

class(TRUE)
class(FALSE)

# TRUE e FALSE são nomes reservados

TRUE <- 1

# Testes com resultado verdadeiro
1 == 1
"a" == "a"

# Testes com resultado falso
1 == 2
"a" == "b"

# Maior
3 > 3
3 > 2

# Maior ou igual
3 > 4
3 >= 3

# Menor 
3 < 3
3 < 4

# Menor ou igual
3 < 2
3 <= 3

3 %in% c(1, 2, 3)
"a" %in% c("b", "c")

# Comprações lógicas serão a base dos filtros!

minha_coluna <- c(1, 3, 0, 10, -1, 5, 20)

minha_coluna > 3

minha_coluna[minha_coluna > 3]


# Exercícios --------------------------------------------------------------

# 1. O que acontece se tentarmos misturar valores lógicos e texto em um
# vetor? E se misturarmos valores lógicos e números?

# 2. Escreva um código que devolva apenas os valores maiores
# ou iguais a 10 do vetor abaixo:

vetor <- c(4, 8, 15, 16, 23, 42)

# [DESAFIO] Escreva um código que devolta apenas os valores pares
# do vetor acima.

# Dica: o operador %% devolve o resto da divisão entre dois números

3 %% 2

# Funções -----------------------------------------------------------------

# Argumentos e ordem

seq(to = 10, from = 1, by = 2)
seq(1, 10, 2)

# Funções dentro de funções

mean(seq(1, 10, 2))

# Guardando as saídas

y <- seq(1, 10, length.out = 5)
y

# Exercícios

# 1) use a funcao 'sum' para somar os valores de 1 a 100

# 2) agora some os valores da coluna mpg do banco 
# de dados mtcars (dica: use o $)


# Criando funções

minha_soma <- function(x, y) {
  
  soma <- x + y
  
  return(soma)
  
}

minha_soma(2, 3)

# Exercício: crie uma função que recebe 2 números
# e devolve a raiz quadrada da soma desses números.
# Dica: sqrt() é a função para raiz quadrada.


# Valores especiais -------------------------------------------------------

# Existem valores reservados para representar dados faltantes, 
# infinitos, e indefinições matemáticas.

NA   # (Not Available) significa dado faltante/indisponível. 

NaN  # (Not a Number) representa indefinições matemáticas, como 0/0 e log(-1). 
# Um NaN é um NA, mas a recíproca não é verdadeira.

Inf  # (Infinito) é um número muito grande ou o limite matemático, por exemplo, 
# 1/0 e 10^310. Aceita sinal negativo -Inf.

NULL # representa a ausência de informação.


# Comparação lógica com valores especiais --------------------------------
# Use as funções is.na(), is.nan(), is.infinite() e is.null() 
# para testar se um objeto é um desses valores.

x <- NA
is.na(x)

0/0 == NaN
is.nan(0/0)

a <- c(1, 2, 3, NA, 5)
is.na(a)

# família de funções que começam com is.*()
is.numeric()
is.character()
is.data.frame()
is.logical()
is.na()
is.nan()
is.null()

# Identação ---------------------------------------------------------------

funcao_com_muitos_argumentos(argumento_1 = 10, argumento_2 = 14, argumento_3 = 30, argumento_4 = 11)

# ATALHO: CTRL+I

# Pacotes -----------------------------------------------------------------

# Para instalar pacotes

install.packages(c("tidyverse", "rmarkdown", "devtools"))

# Para carregar pacotes

library(dplyr)

# Também é possível acessar as funções usando ::

dplyr::select()


# Categorização ------------------------------------------------------------

x <- -10:30

x_categorizado <- ifelse(x < 0, "negativo", "positivo")


# Operações vetoriais  -----------------------------------------------------

a <- 1:4
b <- 4:9

a + 1
a ^ 2
b * 5
b / b

a + b
b * a

# exercícios: crie um vetor 'mpg2' que receba a coluna 
# 'mpg' do mtcars, mas com seus valores ao quadrado.


# Coerção ------------------------------------------------------------------
class(c(1, 2, 3))
class(c("a", "b", "c"))
class(c(TRUE, TRUE, FALSE))

# Misturando diferentes classes
c(1, 2, 3, "a")
c(TRUE, FALSE, "a")
c(1L, "a", "2")
c(TRUE, FALSE, 1, 100)

# Ordem de coerção
# logico < inteiro < numerico < caracter


# Uma das coerções mais importantes: lógico para numérico
x <- 1:10

x < 4
as.numeric(x < 4)
sum(x < 4)
x[x < 4]
sum(x[x < 4])

# exemplo mais complexo!
mtcars$mpg[mtcars$wt >= 3]


# Exercícios:
# 1) crie um vetor lógico 'maior_que_300' que indique 
# se o vetor mpg2 é maior que 300.

# 2) Calcule a soma do objeto maior_que_300 
# (utilize a função sum()).


