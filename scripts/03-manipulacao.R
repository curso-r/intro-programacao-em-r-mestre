# Pacotes -----------------------------------------------------------------

library(tidyverse)

# Base de dados -----------------------------------------------------------

imdb <- read_rds("dados/imdb.rds")

# select ------------------------------------------------------------------

# Selcionando uma coluna da base

select(imdb, titulo)

# A operação NÃO MODIFICA O OBJETO imdb

imdb

# Selecionando várias colunas

select(imdb, titulo, ano, orcamento)

# Funções auxiliares

select(imdb, starts_with("ator"))

# Principais funções auxiliares

# starts_with(): começa com um prefixo
# ends_with(): termina com um prefixo
# contains(): contém uma string (texto)

# Selecionando colunas por exclusão

select(imdb, -starts_with("ator"), -titulo)


# Exercícios --------------------------------------------------------------

# 1. Crie uma tabela com apenas as colunas titulo, diretor, 
# e orcamento. Salve em um objeto chamado imdb_simples.

# 2. Remova as colunas ator_1, ator_2 e ator_3 de três 
# formas diferentes. Salve em um objeto chamado imdb_sem_ator.

# arrange -----------------------------------------------------------------

# Ordenando linhas de forma crescente de acordo com 
# os valores de uma coluna

arrange(imdb, orcamento)

# Agora de forma decrescente

arrange(imdb, desc(orcamento))

# Ordenando de acordo com os valores 
# de duas variáveis

arrange(imdb, desc(ano), titulo)

# O que acontece com o NA?

df <- tibble(x = c(NA, 2, 1), y = c(1, 2, 3))
arrange(df, x)

# Exercícios --------------------------------------------------------------

# 1. Ordene os filmes em ordem crescente de ano e 
# decrescente de receita e salve em um objeto 
# chamado filmes_ordenados.

# 2. Selecione apenas as colunas título e orçamento 
# e então ordene de forma decrescente pelo orçamento.

# Pipe (%>%) --------------------------------------------------------------

# Transforma funçõe aninhadas em funções
# sequenciais

# g(f(x)) = x %>% f() %>% g()

# Receita de bolo sem pipe. 
# Tente entender o que é preciso fazer.

esfrie(
  asse(
    coloque(
      bata(
        acrescente(
          recipiente(
            rep(
              "farinha", 
              2
            ), 
            "água", "fermento", "leite", "óleo"
          ), 
          "farinha", até = "macio"
        ), 
        duração = "3min"
      ), 
      lugar = "forma", tipo = "grande", untada = TRUE
    ), 
    duração = "50min"
  ), 
  "geladeira", "20min"
)

# Veja como o código acima pode ser reescrito 
# utilizando-se o pipe. 
# Agora realmente se parece com uma receita de bolo.

recipiente(rep("farinha", 2), "água", "fermento", "leite", "óleo") %>%
  acrescente("farinha", até = "macio") %>%
  bata(duração = "3min") %>%
  coloque(lugar = "forma", tipo = "grande", untada = TRUE) %>%
  asse(duração = "50min") %>%
  esfrie("geladeira", "20min")

# ATALHO DO %>%: CTRL (command) + SHIFT + M


# Exercício ---------------------------------------------------------------

# Refaça o exercício 2 do arrange utilizando o %>%.

# filter ------------------------------------------------------------------

# Filtrando uma coluna da base

imdb %>% filter(nota_imdb > 9)
imdb %>% filter(diretor == "Quentin Tarantino")

# Vendo categorias de uma variável

unique(imdb$cor) # saída é um vetor
imdb %>% distinct(cor) # saída é uma tibble

# Filtrando duas colunas da base

## Recentes e com nota alta
imdb %>% filter(ano > 2010 & nota_imdb > 8.5)

## Gastaram menos de 100 mil, faturaram mais de 1 milhão
imdb %>% filter(orcamento < 100000, receita > 1000000)

## Lucraram
imdb %>% filter(receita - orcamento > 0)

## Lucraram mais de 500 milhões OU têm nota muito alta
imdb %>% filter(receita - orcamento > 500000000 | nota_imdb > 9)


# Negação
imdb %>% filter(ano > 2010)
imdb %>% filter(!ano > 2010)

# O operador %in%
pitts <- imdb %>% filter(ator_1 %in% c('Angelina Jolie Pitt', "Brad Pitt"))

# O que acontece com o NA?
df <- tibble(x = c(1, NA, 3))

filter(df, x > 1)
filter(df, is.na(x) | x > 1)

# Filtrando texto sem correspondência exata
# A função str_detect()

str_detect(
  string = c("a", "aa","abc", "bc", "A", NA), 
  pattern = "a"
)

## Pegando os seis primeiros valores da coluna "generos"
imdb$generos[1:6]

str_detect(
  string = imdb$generos[1:6],
  pattern = "Action"
)

## Pegando apenas os filmes que 
## tenham o gênero ação
imdb %>% filter(str_detect(generos, "Action"))

# Exercícios --------------------------------------------------------------

# 1. Criar um objeto chamado `filmes_pb` apenas com filmes 
# oreto e branco.

# 2. Criar um objeto chamado curtos_legais com filmes 
# de 1h30 ou menos de duração e nota no imdb maior do que 8.5.

# mutate ------------------------------------------------------------------

# exemplo 1

imdb %>% mutate(duracao = duracao/60)

# exemplo 2

imdb %>% mutate(duracao_horas = duracao/60)

# exercício 1
# Crie uma variável chamada lucro. Salve em um objeto chamado imdb_lucro.

# exercicio 2
# Modifique a variável lucro para ficar na escala de milhões de dólares.

# exercício 3
# Filtre apenas os filmes com prejuízo maior do que 3 milhões de dólares. 
# Deixe essa tabela ordenada com o maior prejuízo primeiro. Salve o resultado em 
# um objeto chamado filmes_prejuizo.

# exemplo 3
# gêneros

# install.packages("gender")
library(gender)

gender(c("William"), years = 2012)
gender(c("Amanda"), years = 2012)
gender(c("Robin"), years = 2012)

gender(c("Madison", "Hillary"), years = 1930, method = "ssa")
gender(c("Madison", "Hillary"), years = 2010, method = "ssa")

gender("Matheus", years = 1920)
gender("Matheus", years = 2012)

# Base com o gênero dos diretores
imdb_generos <- read_rds("dados/imdb_generos.rds")

# Pacote análogo para nomes brasileiros
# https://github.com/meirelesff/genderBR

# summarise ---------------------------------------------------------------

# exemplo 1

imdb %>% summarise(media_orcamento = mean(orcamento, na.rm = TRUE))

# exemplo 2

imdb %>% summarise(
  media_orcamento = mean(orcamento, na.rm = TRUE),
  mediana_orcamento = median(orcamento, na.rm = TRUE),
  qtd = n(),
  qtd_diretores = n_distinct(diretor)
)

# exemplo 3

imdb_generos %>%
  summarise(n_diretora = sum(genero == "female", na.rm = TRUE))

# exercício 1
# Use o `summarise` para calcular a proporção de filmes com diretoras.

# exercício 2
# Calcule a duração média e mediana dos filmes da base.

# exercício 3
# Calcule o lucro médio dos filmes com duracao < 60 minutos. E o lucro médio dos filmes com
# mais de 2 horas.

# group_by + summarise ----------------------------------------------------

# exemplo 1

imdb %>% group_by(ano)

# exemplo 2

imdb %>% 
  group_by(ano) %>% 
  summarise(qtd_filmes = n())

# exemplo 3

imdb %>% 
  group_by(diretor) %>% 
  summarise(qtd_filmes = n())

# exercício 1
# Crie uma tabela com apenas o nome dos diretores com mais de 10 filmes.

# exercício 2
# Crie uma tabela com a receita média e mediana dos filmes por ano.

# exercício 3
# Crie uma tabela com a nota média do imdb dos filmes por tipo de classificacao.

# exemplo 4

imdb %>%
  filter(str_detect(generos, "Action"), !is.na(diretor)) %>%
  group_by(diretor) %>%
  summarise(qtd_filmes = n()) %>%
  arrange(desc(qtd_filmes))

# exemplo 5

imdb %>% 
  filter(ator_1 %in% c("Brad Pitt", "Angelina Jolie Pitt")) %>%
  group_by(ator_1) %>%
  summarise(orcamento = mean(orcamento), receita = mean(receita), qtd = n())

# left join ---------------------------------------------------------------

# exemplo 1

imdb_completa <- imdb %>%
  left_join(imdb_generos, by = c("diretor", "ano"))

View(imdb_completa)

# exemplo 2

depara_cores <- tibble(
  cor = c("Color", "Black and White"),
  cor2 = c("colorido", "pretoEbranco")
)

imdb_cor <- left_join(imdb, depara_cores, by = c("cor"))

# exercicio 1
# Calcule a média dos orçamentos e receitas para filmes feitos por
# gênero do diretor.

# gather ------------------------------------------------------------------

# exemplo 1

imdb_gather <- gather(imdb, "importancia_ator", "nome_ator", starts_with("ator"))

# spread ------------------------------------------------------------------

# exemplo 1

imdb <- spread(imdb_gather, importancia_ator, nome_ator)

