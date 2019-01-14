# Pacotes -----------------------------------------------------------------
library(tidyverse)

# Base de dados -----------------------------------------------------------
imdb <- read_rds("dados/imdb.rds")

# EXERCÍCIO 1
# Leia a base de outras 2 maneiras. 

# filter ------------------------------------------------------------------

# exemplo 1
imdb %>% 
  filter(nota_imdb > 9)

# exemplo 2
filmes_bons <- imdb %>% 
  filter(nota_imdb > 9)

filmes_bons

# exemplo 3
filmes_bons <- filmes_bons %>% 
  filter(orcamento < 1000000)

filmes_bons

# exemplo 4
# comparações com o R

1 == 1
"a" == "b"

sqrt(2) ^ 2 == 2
1 / 49 * 49 == 1

near(sqrt(2) ^ 2,  2)
near(1 / 49 * 49, 1)

bons <- imdb %>% 
  filter(nota_imdb > 9)

bons$ano
bons$ano == 2010
bons$ano > 2010
bons$ano <= 2010

# EXERCÍCIO 2
# Criar uma variável chamada `filmes_baratos` com filmes com orçamento menor do 
# que 1 milhão de dólares.

# exemplo 5
# operadores lógicos

imdb %>% 
  filter(ano > 2010 & nota_imdb > 8.5)
imdb %>% 
  filter(orcamento < 100000 & receita > 1000000)

imdb %>% 
  filter(receita > orcamento)
imdb %>% 
  filter(receita > orcamento + 500000000)
imdb %>% 
  filter(receita > orcamento + 500000000 | nota_imdb > 9)

imdb %>% 
  filter(ano > 2010)
imdb %>% 
  filter(!ano > 2010)
imdb %>% 
  filter(!receita > orcamento)

# EXERCÍCIO 3
# Criar um objeto chamado bons_baratos com filmes que tiveram nota no imdb 
# maior do que 8.5 e um orcamento menor do que 1 milhão de dólares.

# EXERCÍCIO 4
# Criar um objeto chamado curtos_legais com filmes de até 1h30 e nota no imdb
# maior do que 8.5.

# EXERCÍCIO 5
# Criar um objeto antigo_colorido com filmes de antes de 1940 que são 
# coloridos. Crie também um objeto antigo_bw com filmes antigos que não são coloridos.

# EXERCÍCIO 6
# Criar um objeto ww com filmes do Wes Anderson ou do Woody Allen.

# exemplo 6
# %in%

pitts <- imdb %>% 
  filter(ator_1 %in% c('Angelina Jolie Pitt', "Brad Pitt"))

# EXERCÍCIO 7
# Refaça o EXERCÍCIO 6 usando o %in%.

# exemplo 7
# NA

NA > 5
10 == NA
NA + 10
NA / 2
NA == NA

# Seja x a idade de Maria. Não sabemos a idade de Maria:
x <- NA

# Seja y a idade de João. Não sabemos a idade de João:
y <- NA

# Maria e João têm a mesma idade?
x == y
#> [1] NA
# Não sabemos.

is.na(x)

df <- tibble(x = c(1, NA, 3))
filter(df, x > 1)
filter(df, is.na(x) | x > 1)

imdb %>% 
  filter(is.na(orcamento))


# EXERCÍCIO 8 
# Identifique os filmes que não possuem informação tanto de receita quanto de orcamento
# e salve em um objeto com nome sem_info.





# exemplo 8
# str_detect

imdb %>% 
  filter(str_detect(generos, "Action"))

# EXERCÍCIO 9
# Salve em um objeto os filmes de Ação e Comédia com nota no imdb maior do que 8.


# arrange -----------------------------------------------------------------

# exemplo 1

imdb %>% 
  arrange(orcamento)

# exemplo 2

imdb %>% 
  arrange(desc(orcamento))

# exemplo 3

imdb %>% 
  arrange(desc(ano), titulo)

# EXERCÍCIO 10
# Ordene os filmes em ordem decrescente de lucro por ano e salve em um objeto chamado
# filmes_ordenados

# exemplo 4
# NA

df <- tibble(x = c(NA, 1, 2), y = c(1, NA, 2))

df %>% 
  arrange(x)
df %>% 
  arrange(y)
df %>% 
  arrange(!is.na(x), x)

# exemplo 5

imdb %>% filter(ano == 2010) %>% arrange(desc(orcamento))

# EXERCÍCIO 11
# Ordene por ordem decrescente do orçamento os filmes de um diretor a sua escolha.
# Salve o resultado em um objeto chamado diretor_ordenado

# select ------------------------------------------------------------------

# exemplo 1

imdb %>% 
  select(titulo, ano, orcamento)

# exemplo 2 

imdb %>% 
  select(starts_with("ator"))

# exemplo 3

imdb %>% 
  select(-starts_with("ator"), -titulo)

# EXERCÍCIO 12
# Crie uma tabela com apenas as colunas titulo, diretor, e orcamento. Salve em um
# objeto chamado imdb_simples.

# EXERCÍCIO 13
# Remova as colunas ator_1, ator_2 e ator_3 de três formas diferentes. Salve em um
# objeto chamado imdb_sem_ator.

# EXERCÍCIO 14
# Crie uma tabela apenas com filmes do Woody Allen e as colunas titulo e ano
# ordenada por ano.


# mutate ------------------------------------------------------------------

# exemplo 1

imdb %>% 
  mutate(duracao = duracao/60)

# exemplo 2

imdb %>% 
  mutate(duracao_horas = duracao/60)

# EXERCÍCIO 15
# Crie uma variável chamada lucro. Salve em um objeto chamado imdb_lucro.

# EXERCÍCIO 16
# Modifique a variável lucro para ficar na escala de milhões de dólares.

# EXERCÍCIO 17
# Filtre apenas os filmes com prejuízo maior do que 3 milhões de dólares. 
# Deixe essa tabela ordenada com o maior prejuízo primeiro. Salve o resultado em 
# um objeto chamado filmes_prejuizo.

# exemplo 3
# gêneros

# install.packages("gender")
library(gender)

gender(c("Madison", "Hillary"), years = 1930, method = "ssa")
gender(c("Madison", "Hillary"), years = 2010, method = "ssa")
gender("Matheus", years = 1920)

obter_genero <- function(nome, ano) {
  if (is.na(nome) | is.na(ano)) {
    return(NA_character_)
  }
  ano_min <- ano - 60
  ano_max <- ano - 30
  if (ano_min < 1880) {
    ano_min <- 1880
  }
  genero <- gender(nome, years = c(ano_min, ano_max), method = "ssa")$gender
  if(length(genero) == 0) {
    genero <- NA_character_
  }
  genero
}

obter_genero("Madison", 1930)
obter_genero("Matheus", 1930)

## demora +- 10 min.
imdb_generos <- imdb %>%
  select(diretor, ano) %>%
  distinct() %>%
  mutate(
    diretor_primeiro_nome = str_extract(diretor, ".* ") %>% str_trim(),
    genero = map2_chr(diretor_primeiro_nome, ano, obter_genero)
  )

# write_rds(imdb_generos, "dados/imdb_generos.rds")
imdb_generos <- read_rds("dados/imdb_generos.rds")

## Para fazer isso com nomes em português
# https://github.com/meirelesff/genderBR

# summarise ---------------------------------------------------------------

# exemplo 1

imdb %>% 
  summarise(media_orcamento = mean(orcamento, na.rm=TRUE))

# exemplo 2

imdb %>% 
  summarise(
    media_orcamento = mean(orcamento, na.rm=TRUE),
    mediana_orcamento = median(orcamento, na.rm = TRUE)
  )

# exemplo 3

imdb %>% 
  summarise(
    media_orcamento = mean(orcamento, na.rm=TRUE),
    mediana_orcamento = median(orcamento, na.rm = TRUE),
    qtd = n(),
    qtd_diretores = n_distinct(diretor)
  )

# exemplo 4

imdb_generos %>%
  summarise(n_diretora = sum(genero == "female", na.rm = TRUE))

# EXERCÍCIO 18
# Use o `summarise` para calcular a proporção de filmes com diretoras.

# EXERCÍCIO 19
# Calcule a duração média e mediana dos filmes da base.

# EXERCÍCIO 20
# Calcule o lucro médio dos filmes com duracao < 60 minutos. E o lucro médio dos filmes com
# mais de 2 horas.

# group_by + summarise ----------------------------------------------------

# exemplo 1

imdb %>% 
  group_by(ano)

# exemplo 2

imdb %>% 
  group_by(ano) %>% 
  summarise(qtd_filmes = n())

# exemplo 3

imdb %>% 
  group_by(diretor) %>% 
  summarise(qtd_filmes = n())

# EXERCÍCIO 21
# Crie uma tabela com apenas o nome dos diretores com mais de 10 filmes.

# EXERCÍCIO 22
# Crie uma tabela com a receita média e mediana dos filmes por ano.

# EXERCÍCIO 23
# Crie uma tabela com a nota média do imdb dos filmes por tipo de classificacao.

# EXERCÍCIO 24
# Faça uma tabela de contagens de filmes por diretor, ordenada pela quantidade


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

imdb_generos %>% 
  distinct(diretor, ano)

# exemplo 1
imdb_com_generos <- imdb %>%
  left_join(imdb_generos, by = c("diretor", "ano"))

imdb_com_generos %>% View

# exemplo 2
# podemos usar joins para fazer de-para

depara_cores <- tibble(
  cor = c("Color", "Black and White"),
  cor_ptbr = c("colorido", "pretoEbranco")
)

imdb_cor <- imdb %>% 
  left_join(depara_cores, by = c("cor"))

imdb_cor %>% 
  select(titulo, cor, cor_ptbr) %>% 
  View

# exemplo 3

imdb_mulheres <- imdb_generos %>% 
  filter(genero == "female")

imdb_so_mulheres <- imdb %>%
  inner_join(imdb_mulheres, by = c("diretor", "ano"))

View(imdb_so_mulheres)

# EXERCÍCIO 25
# Calcule a média dos orçamentos e receitas para filmes feitos por
# genero do diretor.

imdb_com_generos %>% 
  filter(!is.na(genero)) %>% 
  group_by(genero) %>% 
  summarise(
    orcamento_medio = mean(orcamento, na.rm = TRUE),
    receita_media = mean(receita, na.rm = TRUE)
  )

# gather ------------------------------------------------------------------
# exemplo 1
imdb_gather <- imdb %>% 
  mutate(id = 1:n()) %>% 
  gather(
    key = "importancia_ator", 
    value = "nome_ator", 
    ator_1, ator_2, ator_3
  )

imdb_spread <- imdb_gather %>% 
  spread(
    key = importancia_ator,
    value = nome_ator
  )

View(imdb_gather)
View(imdb_spread)

# spread ------------------------------------------------------------------
# exemplo 1
ano_genero <- imdb_com_generos %>%
  group_by(ano, genero) %>%
  summarise(orcamento = mean(orcamento, na.rm = TRUE)) %>% 
  ungroup()

ano_genero %>%
  filter(!is.na(genero)) %>% 
  spread(genero, orcamento) %>% 
  View

# EXERCÍCIO 26
# Crie uma tabela de dupla entrada de genero e classificacao

imdb_com_generos %>%
  filter(!is.na(genero)) %>% 
  count(genero, classificacao) %>% 
  spread(classificacao, n) %>% 
  View

table(imdb_com_generos$genero, imdb_com_generos$classificacao)

tidyr::gather()
tidyr::spread()

tidyr::separate()
tidyr::unite()


# separate/unite
# nest/unnest

imdb %>% 
  group_by(ano) %>% 
  nest()

# misc:
# - count
# - lag/lead
# - if_else/case_when
# xx_at, xx_if, xx_all

mutate(imdb, nova_coluna = case_when(
  ano < 1950 ~ "muito velho",
  ano < 1980 ~ "velho",
  ano < 2000 ~ "...",
  TRUE ~  "outros"
)) %>% View

