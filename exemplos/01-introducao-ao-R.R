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

# salvar saída versus apenas executar
33/11
resultado <- 33/11

# atualizar um objeto
resultado <- resultado * 5

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

# 1. Multiplique a sua idade por 12 e salve em um objeto chamado "meses".



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

# Data frames -------------------------------------------------------------

mtcars

# vamos aprender tudo com calma mais pra frente...
class(mtcars)
str(iris)
head(mtcars)
View(mtcars)
names(mtcars)
dim(mtcars)
nrow(mtcars)
ncol(mtcars)

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

# Você também pode excluir elementos de um vetor

vetor[-1]
vetor[-c(2, 3)]

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


# character > numeric > integer > logical

# coerções forçadas por você
as.numeric(c(TRUE, FALSE, FALSE))
as.character(c(TRUE, FALSE, FALSE))

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

# c. Multiplique todos os valores do vetor por -1. Guarde o resultado em
# um novo objeto chamado 'versao_negativa'.

# Comparações lógicas ------------------------------------------------------

# Valores lógicos

class(TRUE)
class(FALSE)

# TRUE e FALSE são nomes reservados

TRUE <- 1


x <- 1
# Testes com resultado verdadeiro
x == 1
"a" == "a"

# Testes com resultado falso
x == 2
"a" == "b"

# Maior
x > 3
x > 0

# Maior ou igual
x > 1
x >= 1

# Menor 
x < 3
x < 0

# Menor ou igual
x < 1
x <= 1

# Diferente
x != 1
x != 2

x %in% c(1, 2, 3)
"a" %in% c("b", "c")

# Comprações lógicas serão a base dos filtros!

avaliacao_do_cliente <- c(1, 3, 0, 10, 2, 5, 20)
estado_de_nascimento <- c("SP", "PB", "PB", "RJ", "MT", "MT")

avaliacao_do_cliente > 3
estado_de_nascimento %in% c("SP", "MT")

avaliacao_do_cliente[avaliacao_do_cliente > 3]
avaliacao_do_cliente[estado_de_nascimento %in% c("SP", "MT")]


# Exercícios --------------------------------------------------------------

# 1. Escreva um código que devolva apenas os valores maiores
# ou iguais a 10 do vetor abaixo:

vetor <- c(4, 8, 15, 16, 23, 42)


# Valores especiais -------------------------------------------------------

# Existem valores reservados para representar dados faltantes, 
# infinitos, e indefinições matemáticas.

NA   # (Not Available) significa dado faltante/indisponível. 

NaN  # (Not a Number) representa indefinições matemáticas, como 0/0 e log(-1). 
# Um NaN é um NA, mas a recíproca não é verdadeira.

Inf  # (Infinito) é um número muito grande ou o limite matemático, por exemplo, 
# 1/0 e 10^310. Aceita sinal negativo -Inf.

NULL # representa a ausência de objeto (no R).

# Comparações lógicas

idade_ana <- 30
idade_beto <- NA
idade_carla <- NA

idade_ana == idade_beto

idade_beto == idade_carla

5 == NA

# Use as funções is.na(), is.nan(), is.infinite() e is.null() 
# para testar se um objeto é um desses valores.

x <- NA
is.na(x)

0/0 == NaN
is.nan(0/0)


idades <- c(15, 64, 31, NA, 59)
is.na(idades)

is.nan(NaN)
is.infinite(10^309)
is.null(NULL)


# Data frames, o retorno --------------------------------------------------

mtcars

# Selecionando uma coluna do data frame

mtcars$mpg
mtcars$disp

mtcars[["mpg"]]
mtcars[["cyl"]]

mtcars[[1]]
mtcars[[2]]

mtcars[ , 1]
mtcars[ , 2]

# A classe data frame tem uma característica especial: dimensão

dim(mtcars)

vetor <- c(1, 2)
dim(vetor)

# Subsetting em objetos com 2 dimensões

# Sinxtaxe: data_frame[indice_linha, indice_coluna]

mtcars[1,1]
mtcars[,1]
mtcars[1,]

# Selecionando colunas

mtcars[, c(1, 2)]
mtcars[, c("mpg", "am")]

# Filtrando linhas

mtcars$cyl
mtcars$cyl == 4

mtcars[mtcars$cyl == 4, ]
mtcars[mtcars$mpg > 25, ]

# Veremos E e OU com mais detalhes na hora do filter() 
mtcars[mtcars$mpg > 25 | mtcars$cyl == 4, ]
mtcars[mtcars$mpg > 25 & mtcars$cyl == 4, ]

# Funções -----------------------------------------------------------------

# Funções são nomes que guardam um código de R. Esse código é
# avaliado quando rodamos uma função.

# a função `c()` foi utilizada para criar vetores;
# a função `class()` foi utilizada para descobrir a classe de um objeto;

# Argumentos

# Argumentos são sempre separados por vírgulas

c(1, 3, 5)

# A ordem é importante se você não nomear os argumentos

seq(from = 4, to = 10, by = 2)
seq(4, 10, 2)

seq(by = 2, to = 10, from = 4)
seq(2, 10, 4)

?seq
help(seq)


# Exemplo 1

sum(c(1, 2))
mean(c(1, 2))

# Exemplo 2

mean(c(1, 2, NA))
mean(c(1, 2, NA), rm = TRUE)

cor(mtcars$mpg, mtcars$wt)
cor(c(1, 3, 2), c(3, NA, 10), na.rm = TRUE)

log(5)
log(c(3, 5))
log(c(3, 5, NA))

# Colunas de data frames são vetores

log(mtcars$mpg)
mean(mtcars$mpg)

# Funções dentro de funções
mean(log(mtcars$mpg))

# Criando funções ------------------------------------------------
# uma f(x) = a + x*b
f <- function(x) {
  2 + 3 * x
}

f(0)
f(1)
f(1:10)

minha_soma <- function(x, y) {
  
  # códigos de R
  # códigos de R
  # códigos de R
  # códigos de R
  
  soma <- x + y
  
  return(soma)
  
}

minha_soma(30, 22)


# não precisa ser só numeros, os argumentos podem ser qualquer coisa
cola_dois_textos <- function(x, y) {
  paste0(x, y)
}

cola_dois_textos("alo", "ola")

# um exemplo com argumento que tem valor pré-definido
duplica_data_frame <- function(df, quiser_empilhar = FALSE) {
  if(empilhar) {
    rbind(df, df)
  } else {
    cbind(df, df)
  }
}

mini_data_frame <- mtcars[1:3, 1:3]
duplica_data_frame(mini_data_frame)
duplica_data_frame(mini_data_frame, empilhar = TRUE)

# Exercícios --------------------------------------------------------------

# 1. Use a funcao 'sum' para somar os valores de 1 a 100

# 2. Agora tire a média (mean) dos quadrados (^2) da coluna mtcars$mpg.

# Pacotes -----------------------------------------------------------------

# Para instalar pacotes

install.packages("tidyverse")
install.packages(c("remotes", "rmarkdown", "knitr","skimr", 
                   "readxl", "writexl", "openxlsx", "haven",
                   "DBI", "RSQLite", "jsonlite"))

# Pacotes que não são oficiais
remotes::install_github("curso-r/CursoR")

# Para carregar pacotes
library(tidyverse)
library(dplyr)

# Também é possível acessar as funções usando ::
dplyr::filter_at()
dplyr::transmute()

