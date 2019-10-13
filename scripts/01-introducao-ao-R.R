# Nome dos objetos/variáveis ----------------------------------------------

# Criando objetos/variáveis -----------------------------------------------

obj <- 1
obj

# também dizemos 'guardando as saídas'
y <- seq(1, 10, length.out = 5)
y

# ATALHO para rodar o código: CTRL + ENTER
# ATALHO para a <- : ALT - (alt menos)

# O R difencia minúscula de maiúscula!

a <- 5
A <- 42

# Os nomes devem começar com uma letra. Podem conter letras, números, _ e .

eu_uso_snake_case
outrasPessoasUsamCamelCase
algumas.pessoas.usam.pontos
E_algumasPoucas.Pessoas_RENUNCIAMconvenções

# Vetores -----------------------------------------------------------------

# Vetores são conjuntos ordenados de números

c(1, 4, 3, 10)

1:10

# Subsetting

vetor <- c(4, 8, 15, 16, 23, 42)

vetor[1]
vetor[c(1, 3)]
vetor[-5]
vetor[-c(1, 3)]


# exercícios:
# 1) crie um vetor de 0 a 5 e guarde num objeto chamado 'zero_a_cinco'
# dica: usar o operador : (1:10)

# 2) extraia apenas os números 0 e 5 desse vetor



# Tipos -------------------------------------------------------------------

# Numéricos (numeric)

a <- 10
class(a)

# Caracteres (character, strings)

obj <- "a"
obj2 <- "masculino"

class(obj)

# lógicos (logical, booleanos)

verdadeiro <- TRUE
falso <- FALSE

class(falso)

# Bases (data.frame)

mtcars
class(mtcars)

# o operador $
mtcars$mpg

# exercício 1: na linha debaixo, coloque o $ e aperte TAB

# exercício 2: selecione a coluna 'cyl' usando o $ e 
# depois extraia os valores de 4 a 8


# Funções -----------------------------------------------------------------

# Argumentos e ordem

seq(to = 10, from = 1, by = 2)
seq(1, 10, 2)

# Funções dentro de funções

mean(seq(1, 10, 2))

# Guardando as saídas

y <- seq(1, 10, length.out = 5)
y

# exercícios:
# 1) use a funcao 'sum' para somar os valores de 1 a 100

# 2) agora some os valores da coluna mpg do banco de dados mtcars (dica: use o $)


# Criando funções

minha_soma <- function(x, y) {
  
  x + y
  
}

minha_soma(2, 3)

# Retornando explicitamente

minha_soma2 <- function(x, y) {
  
  x <- x^2
  y <-y^2
  
  soma <- x + y
  
  return(soma)
  
}

minha_soma2(1, 2)


# Comparações lógicas ------------------------------------------------------

1 > 0
2 < 1
3 == 3
3 != 1
5 %in% c(2, 4, 5)

# e também
!5 %in% c(2, 4, 5)
1 >= 0
2 <= 1

# exercício: crie um vetor de números e veja o que acontece se você fizer
# uma comparação lógica com ele.


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

# exercícios:
# 1) crie um vetor 'mpg2' que receba a coluna 'mpg' do mtcars, mas com seus valores ao quadrado


# Coerção ------------------------------------------------------------------
class(c(1, 2, 3))
class(c("a", "b", "c"))
class(c(TRUE, TRUE, FALSE))

# misturando diferentes classes...
c(1, 2, 3, "a")
c(TRUE, FALSE, "a")
c(1L, "a", "2")
c(TRUE, FALSE, 1, 100)

# logico < inteiro < numerico < caracter

#-----------------------------------------------------------------------
# uma das coerções mais importantes: lógico para numérico
x <- 1:10

x < 4
as.numeric(x < 4)
sum(x < 4)
x[x < 4]
sum(x[x < 4])

# exemplo mais complexo!
mtcars$mpg[mtcars$wt >= 3]

# logico < inteiro < numerico < caracter

# exercícios:
# 1) crie um vetor lógico 'maior_que_300' que indique se o vetor mpg2 é maior que 300.

# 2) calcule a soma de maior_que_300 (utilize a função sum()).


