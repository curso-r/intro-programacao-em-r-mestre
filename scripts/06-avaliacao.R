library(tidyverse)

# IMPORTANTE!
# Não use esse script como rascunho. Escreva nele apenas o código
# correspondente às respostas. Se o seu script não rodar, sua nota
# será ZERO.

# Escreva seu nome entre as aspas
nome <- ""

# Exercício 1
# Crie uma função chamada `res1` que, dado um vetor numérico `x`, 
# ela devolva o coeficiente de variação de x (desvio-padrão dividido 
# pela média). A função não pode retornar NA, devendo retornar um erro
# quando não for possível calcular o coeficiente de variação.

res1 <- function(x) {
  
  # Passo 1: verifica se x é vum vetor
  
  # Passo 2: verifica se x é numérico
  
  # Passo 3: calcula o coeficiente de variação (desvio-padrão/média)
  
}

# Exercício 2
# Salve em um objeto chamado res2 um data frame com as 5 maiores receitas do
# diretor "Martin Scorsese". Essa tabela deve conter apenas 2 colunas:
# o nome do filme e a receita. A tabela deve estar ordenada pela receita.

imdb <- readr::read_rds("dados/imdb.rds")

res2 <- ...


# Exercício 3
# Salve um um objeto chamado res3 um data frame com cada um dos filmes da 
# base `imdb` e uma nova coluna chamada `nota_imdb_cat`. Essa nova 
# variável deve receber a string "bom" se a nota_imdb for maior que 7 e "ruim"
# caso contrário. O data frame final, com dimensão 3807 linhas por 2 colunas, 
# deve ter apenas as colunas `titulo` e `nota_imdb_cat`.

imdb <- readr::read_rds("dados/imdb.rds")

res3 <- ...

# Exercício 4
# Qual dos códigos abaixo gerou a figura contida no objeto `p`?
# Responda atribuindo a letra correspondente a resposta correta
# no objeto "res4". Por exemplo: se você achar que a respota correta
# é a letra "a", a resposta deverá ser `res4 <- "a"`.

p <- readRDS("dados/p.rds")
p

# a

# dados %>% 
#   ggplot() +
#   geom_point(aes(x = x, y = y)) +
#   geom_smooth(method = "lm") +
#   facet_wrap(~z) +
#   theme_minimal()

# b

# dados %>% 
#   ggplot() +
#   geom_point(aes(x = x, y = y)) +
#   geom_smooth(aes(x = x, y = y)) +
#   facet_wrap(~z)

# c

# dados %>% 
#   ggplot(aes(x = x, y = y)) +
#   geom_point() +
#   geom_smooth(method = "lm", se = FALSE) +
#   facet_wrap(~z) +
#   theme_bw()

# d

# dados %>% 
#   ggplot(aes(x = x, y = y)) +
#   geom_point() +
#   geom_smooth(method = "lm", se = FALSE) +
#   theme_bw()

res4 <- ""
