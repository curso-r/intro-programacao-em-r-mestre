# Pacotes -----------------------------------------------------------------

library(tidyverse)

# Base de dados -----------------------------------------------------------

imdb <- read_rds("dados/imdb.rds")

# select ------------------------------------------------------------------

# exemplo 1

select(imdb, titulo, ano, orcamento)

# exemplo 2 

select(imdb, starts_with("ator"))

# exemplo 3

select(imdb, -starts_with("ator"), -titulo)

# Exercício 1
# Crie uma tabela com apenas as colunas titulo, diretor, e orcamento. Salve em um
# objeto chamado imdb_simples.

# Exercício 2
# Remova as colunas ator_1, ator_2 e ator_3 de três formas diferentes. Salve em um
# objeto chamado imdb_sem_ator.

# arrange -----------------------------------------------------------------

# exemplo 1

arrange(imdb, orcamento)

# exemplo 2

arrange(imdb, desc(orcamento))

# exemplo 3

arrange(imdb, desc(ano), titulo)

# exercício 1
# Ordene os filmes em ordem crescente de ano e decrescente de lucro e salve 
# em um objeto chamado filmes_ordenados

# exemplo 4
# NA

df <- tibble(x = c(NA, 2, 1), y = c(1, 2, 3))
arrange(df, x)

# exemplo 5

imdb %>% filter(ano == 2010) %>% arrange(desc(orcamento))

# Exercício 2 
# Selecione apenas as colunas título e orçamento 
# e então ordene de forma decrescente pelo orçamento.



# Pipe (%>%) --------------------------------------------------------------

# g(f(x)) = x %>% f() %>% g()

# Receita de bolo sem pipe. Tente entender o que é preciso fazer.

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

# Veja como o código acima pode ser reescrito utilizando-se o pipe. 
# Agora realmente se parece com uma receita de bolo.

recipiente(rep("farinha", 2), "água", "fermento", "leite", "óleo") %>%
  acrescente("farinha", até = "macio") %>%
  bata(duração = "3min") %>%
  coloque(lugar = "forma", tipo = "grande", untada = TRUE) %>%
  asse(duração = "50min") %>%
  esfrie("geladeira", "20min")

# ATALHO: CTRL + SHIFT + M

# Exercício
# Refaça o exercício 2 do arrange utilizando o %>% 


# filter ------------------------------------------------------------------

# exemplo 1
imdb %>% filter(nota_imdb > 9)

# exemplo 2
imdb %>% filter(diretor == "Quentin Tarantino")

# exercício 1
# Criar uma variável chamada `filmes_baratos` com filmes com orçamento menor do 
# que 1 milhão de dólares.

# exemplo 3
imdb %>% filter(ano > 2010 & nota_imdb > 8.5)
imdb %>% filter(orcamento < 100000, receita > 1000000)
imdb %>% filter(receita > orcamento + 500000000 | nota_imdb > 9)

# exemplo 4
imdb %>% filter(receita > orcamento)
imdb %>% filter(receita > orcamento + 500000000)

# exemplo 5
imdb %>% filter(ano > 2010)
imdb %>% filter(!ano > 2010)

# exercício 2
# Criar um objeto chamado bons_baratos com filmes que tiveram nota no imdb 
# maior do que 8.5 e um orcamento menor do que 1 milhão de dólares.

# exercício 3
# Criar um objeto chamado curtos_legais com filmes de 1h30 ou menos de duração 
# e nota no imdb maior do que 8.5.

# exercício 4
# Criar um objeto antigo_colorido com filmes anteriores a 1950 que são 
# coloridos. Crie também um objeto antigo_bw com filmes antigos que não são coloridos.

# exercício 5
# Criar um objeto ww com filmes do Wes Anderson ou do Woody Allen.

# Exercício 6
# Crie uma tabela apenas com filmes do Woody Allen e apenas as colunas titulo e ano,
# ordenada por ano.

# exemplo 6
# %in%

pitts <- imdb %>% filter(ator_1 %in% c('Angelina Jolie Pitt', "Brad Pitt"))

# exercicio 6
# Refaça o exercício 5 usando o %in%.

# exemplo 7
df <- tibble(x = c(1, NA, 3))
filter(df, x > 1)
filter(df, is.na(x) | x > 1)

# exercício 7
# Identifique os filmes que não possuem informação tanto de receita quanto de orcamento
# e salve em um objeto com nome sem_info.


# exemplo 8
# str_detect

imdb %>% filter(str_detect(generos, "Action"))

# exercício 8
# Salve em um objeto os filmes de Ação e Comédia com nota no imdb maior do que 8.


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
gender(c("Robin"), years = 2012)

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

# demora +- 10 min.
imdb_generos <- imdb %>%
  select(diretor, ano) %>%
  distinct() %>%
  mutate(
    diretor_primeiro_nome = str_extract(diretor, ".* ") %>% str_trim(),
    genero = map2_chr(diretor_primeiro_nome, ano, obter_genero)
  )

# saveRDS(imdb_generos, "data/imdb_generos.rds")
imdb_generos <- read_rds("dados/imdb_generos.rds")

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

imdb_generos2 <- imdb %>%
  left_join(imdb_generos, by = c("diretor", "ano"))

# exemplo 2

depara_cores <- tibble(
  cor = c("Color", "Black and White"),
  cor2 = c("colorido", "pretoEbranco")
)

imdb_cor <- left_join(imdb, depara_cores, by = c("cor"))


# exercicio 1
# Calcule a média dos orçamentos e receitas para filmes feitos por
# genero do diretor.

# gather ------------------------------------------------------------------

# exemplo 1

imdb_gather <- gather(imdb, "importancia_ator", "nome_ator", starts_with("ator"))

# spread ------------------------------------------------------------------

# exemplo 1

imdb <- spread(imdb_gather, importancia_ator, nome_ator)

