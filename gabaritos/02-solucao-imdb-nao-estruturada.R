library(tidyverse)

col_names = c("titulo", "ano", "diretor", "duracao", 
              "cor", "genero", "pais", "idade", "receita", 
              "orcamento", "nota", "fb_likes", "ator1", "ator2", "ator3")

imdb <- read_excel(
  "dados/imdb_nao_estruturada.xlsx", 
  skip = 1,
  col_names = FALSE
)

colnames(imdb) <- col_names


imdb <- read_excel(
  range = "A3:O3717",
  
  "dados/imdb_nao_estruturada.xlsx", 
  skip = 1,
  col_names = FALSE
)

imdb <- read_excel( 
  "dados/imdb_nao_estruturada.xlsx", 
  skip = 1,
  n_max = 3714,
  col_names = FALSE,
)




