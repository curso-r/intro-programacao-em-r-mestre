# Exercícios de manipulação de dados usando dplyr ################################################################

# Dicas: 
# entre pelo .Rproj (cubo azul) do nosso projeto.
# as funções principais são os seis verbos: mutate(), filter(), arrange(), select(), group_by(), summarise()


# dados e pacotes -------------------------------------------------------------------------------------------------
# 0. carregue o pacote tidyverse

library(tidyverse)

# 1. Carregue os dados imdb utilizados em aula e dê uma olhada nela com a função glimpse().

imdb <- read_rds("dados/imdb.rds")

# 1. FILTER -------------------------------------------------------------------------------------------------------
# Retorne tabelas (tibbles) apenas com:
  
# 1.1. filmes coloridos anteriores a 1950;

unique(imdb$cor)

imdb %>% 
  filter(cor == "Color", ano < 1950)

# 1.2. filmes dos diretores "Woody Allen" ou do "Wes Anderson";

imdb %>% 
  filter(diretor %in% c("Woody Allen", "Wes Anderson")) %>% 
  View()

imdb %>% 
  filter(diretor == "Woody Allen" | diretor == "Wes Anderson")

# 1.3. filmes do "Steven Spielberg" ordenados de forma decrescente por 
# ano, mostrando apenas as colunas "titulo" e "ano";

imdb %>% 
  filter(diretor == "Steven Spielberg") %>% 
  arrange(desc(ano)) %>% 
  select(titulo, ano)

# 1.4. filmes que tenham "Action" OU "Comedy" entre os seus gêneros;
# dica: str_detect()

imdb %>% 
  filter(str_detect(generos, "Action") | str_detect(generos, "Comedy")) %>% 
  View()

# TRUE | TRUE
# FALSE | TRUE
# TRUE | FALSE | FALSE | FALSE
# FALSE | FALSE | FALSE | FALSE

imdb %>% 
  filter(str_detect(generos, "Action|Comedy"))

# regex: expressoes regulares

# 1.5. filmes que tenham "Action" E "Comedy" (atenção ao E, e não OU) entre os 
# seus gêneros e tenha nota_imdb maior que 8;

imdb %>% 
  filter(
    str_detect(generos, "Action"), str_detect(generos, "Comedy"),
    nota_imdb > 8
  ) %>% 
  View()

imdb %>% 
  filter(str_detect(generos, "Action.*Comedy"), nota_imdb > 8) %>% View

TRUE & TRUE
FALSE & TRUE
TRUE & FALSE & FALSE & FALSE
FALSE & FALSE & FALSE & FALSE

# 1.6. filmes que não possuem informação tanto de receita quanto de orçamento (isto é, possuem NA em ambas as colunas).

imdb %>% 
  filter(is.na(orcamento), is.na(receita)) %>% View

# 2. SUMMARISE/GROUP_BY ---------------------------------------------------------------------------------------------
# Retorne tabelas (tibbles) apenas com:

# 2.1. a nota média do imdb dos filmes por tipo de classificacao.

imdb %>% 
  group_by(classificacao) %>% 
  summarise(nota_media = mean(nota_imdb, na.rm = TRUE))

# 2.2. a receita média e mediana dos filmes por ano.

imdb %>% 
  group_by(ano) %>% 
  summarise(
    receita_media = mean(receita, na.rm = TRUE),
    receita_mediana = median(receita, na.rm = TRUE)
  ) %>% 
  filter(
    !is.na(receita_media),
    !is.na(receita_mediana)
  )

# imdb %>% filter(ano == 1916) %>% View()

# mean(c(NA), na.rm = TRUE)
# median(c(NA), na.rm = TRUE)

# 2.3. apenas o nome dos diretores com mais de 10 filmes.

imdb %>% 
  filter(!is.na(diretor)) %>% 
  group_by(diretor) %>% 
  summarise(num_filmes = n()) %>% 
  filter(num_filmes > 10) %>% 
  select(diretor)

imdb %>% 
  filter(!is.na(diretor)) %>% 
  count(diretor, name = "num_filmes") %>% 
  filter(num_filmes > 10) %>% 
  select(diretor)


# 2.4. colunas título e ano, ordenada por ano em ordem decrescente.

imdb %>% 
  select(titulo, ano) %>% 
  arrange(desc(ano))

# 2.5. colunas título e nota_imdb, ordenada por nota_imdb em ordem crescente.

imdb %>% 
  select(titulo, nota_imdb) %>% 
  arrange(nota_imdb)

# 2.6. Usando a função select (e seus ajudantes),  escreva um código que 
# retorne a base IMDB sem as colunas
# ator_1, ator_2 e ator_3 da base imdb. Escreva todas as soluções 
# diferentes que você conseguir pensar. 
# Desafio: enviar pelo menos 4 soluções diferentes.

imdb %>% select(-starts_with("ator"))

imdb %>% select(-ator_1, -ator_2, -ator_3)

imdb %>% select(-(ator_1:ator_3))

imdb %>% select(titulo:likes_facebook)

imdb %>% select(-contains("ator"))

# 3. MUTATE ---------------------------------------------------------------------------------------------

# 3.1 Fazendo apenas uma chamada da função mutate(), crie as seguintes colunas novas no imdb:
# 
# a) lucro = receita - despesa
# b) lucro_medio
# c) lucro_relativo = (lucro - lucro_medio)/lucro_medio
# d) houve_lucro = ifelse(lucro > 0, ...)

imdb %>% 
  mutate(
    lucro = receita - orcamento,
    lucro_medio = mean(lucro, na.rm = TRUE),
    lucro_relativo = (lucro - lucro_medio)/lucro_medio,
    houve_lucro = ifelse(lucro > 0, "Sim", "Não")
  ) %>% 
  View()

# 4. (Avançado) SABESP ---------------------------------------------------------------------------------------------

# 4.1 Instale o pacote 'httr' com install.packages()

install.packages("httr")

# 4.2 Carregue o pacote 'httr' com library()

library(httr)

# 4.3 A função abaixo, chamada baixar_sabesp(), pega informações diretamente do site da SABESP.
# Crie essa função (apenas rode o código abaixo).
# Curiosidade: SABESP é a Cia. de Saneamento Básico do Estado de São Paulo. 
baixar_sabesp <- function(data) {
  u_sabesp <- paste0("http://mananciais.sabesp.com.br/api/Mananciais/ResumoSistemas/", data)
  r_sabesp <- httr::GET(u_sabesp)
  results <- httr::content(r_sabesp, simplifyDataFrame = TRUE)
  results$ReturnObj$sistemas
}

# Web scraping

# Dê uma olhada no que essa função está fazendo:
baixar_sabesp("2020-03-13")

# 4.4. Na linha abaixo, o objeto tab_sabesp recebe a tabela do dia `Sys.Date() - 1` (ontem)
# Após rodar as linhas abaixo, confira o que tem dentro dos objetos "ontem" e "tab_sabesp".
ontem <- Sys.Date() - 1
tab_sabesp <- baixar_sabesp(ontem)


# 4.5. Arrumar os dados. Siga as etapas (pense como os seis verbos podem te ajudar!)
# a) selecione apenas as colunas Nome e PrecMensal. Use select().
# b) A coluna PrecMensal é um texto e está com vírgulas separando o decimal.
#    Precisamos substituir a "," por "." e depois transformar de texto para numérica.
#    use as funções str_replace(PrecMensal, ",", ".") e as.numeric() para isso.
#    OBS: tem que fazer essas transformações da coluna PrecMensal dentro do mutate()!
# c) Ordene da maior precipitação para a menor usando arrange().

dados_arrumados <- tab_sabesp %>% 
  select(Nome, PrecMensal) %>% 
  mutate(
    PrecMensal = str_replace(PrecMensal, ",", "."),
    PrecMensal = as.numeric(PrecMensal)
  ) %>%
  arrange(desc(PrecMensal))

# 5. [extra] [não ensinado ainda] crie um gráfico de barras da tabela dados_arrumados criada acima.
library(ggplot2)

dados_arrumados %>% 
  mutate(Nome = forcats::fct_reorder(Nome, PrecMensal)) %>% 
  ggplot(aes(x = Nome, y = PrecMensal)) +
  geom_col(fill = "royal blue")

