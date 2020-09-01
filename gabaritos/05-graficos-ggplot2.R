# Exercícios de gráficos com ggplot2 --------------------------------------

library(tidyverse)

# Para fazer os exercícios abaixo, utilize a base IMDB.

imdb <- read_rds("dados/imdb.rds")

# Utilize títulos, labels e cores para que os gráficos
# fiquem bem formatados, como se eles fossem ser entregues
# em um relatório de trabalho ou publicados para o
# público.

# 1. Faça um gráfico de dispersão (gráfico de pontos) da nota imdb
# contra o orçamento do filme.
# dicas: ggplot() aes() geom_point()
imdb %>%
  ggplot() +
  geom_point(aes(y = nota_imdb, x = orcamento))

# Desafio: trace uma reta vertical indicando o orçamento médio.
# dicas: geom_abline()
imdb %>%
  ggplot() +
  geom_point(aes(y = nota_imdb, x = orcamento)) +
  geom_vline(xintercept = mean(imdb$orcamento, na.rm = TRUE), colour = "red")

# -------------------------------------------------------------------------

# 2. Rode o código abaixo.

diretores <- c(
  "Steven Spielberg",
  "Quentin Tarantino",
  "Christopher Nolan",
  "Martin Scorsese"
)

imdb %>%
  filter(diretor %in% diretores) %>%
  group_by(ano, diretor) %>%
  summarise(nota_media = mean(nota_imdb, na.rm = TRUE)) %>%
  ggplot(aes(x = ano, y = nota_media)) +
  geom_point() +
  geom_line() +
  facet_wrap(vars(diretor))

# a) Analisando o gráfico gerado,
# descreva o que a função facet_wrap() faz.

# A função facet_wrap() replica o gráfico especificado para cada categoria de uma coluna.

# Dica: olhe a documentação da função facet_wrap().
help(facet_wrap)


# b) Utilize os argumentos nrow e ncol da função
# facet_wrap() para colocar os quatro gráficos
# em uma única coluna.
imdb %>%
  filter(diretor %in% diretores) %>%
  group_by(ano, diretor) %>%
  summarise(nota_media = mean(nota_imdb, na.rm = TRUE)) %>%
  ggplot(aes(x = ano, y = nota_media)) +
  geom_point() +
  geom_line() +
  facet_wrap(vars(diretor), ncol = 1)

# -------------------------------------------------------------------------

# 3. Vamos fazer um gráfico de barras do número de
# filmes com nota maior que 8 ao longo dos anos.

# a. Crie uma nova coluna na base IMDB indicando
# se a nota de um filme é maior que 8 ou não.
imdb <- imdb %>%
  mutate(nota_maior_que_8 = ifelse(nota_imdb > 8, "Nota maior que 8", "Nota menor que 8"))

# Dica: use a função ifelse.

# b. Utilizando a coluna criada em (a),
# crie uma tabela com o número anual de filmes
# com nota maior 8.

tabela <- imdb %>%
  filter(nota_maior_que_8 == "Nota maior que 8") %>%
  count(ano)

# c. Utilize a tabela criada em (b) para
# fazer um gráfico de barras do número de
# filmes com nota maior que 8 ao longo dos anos.

tabela %>%
  ggplot(aes(x = ano, y = n)) +
  geom_col()


# -------------------------------------------------------------------------

# 4. Juntando gráficos diferentes.

# a. Instale o pacote patchwork.
install.packages("patchwork")

# b. Faça um gráfico das nota médias dos
# filmes do Keanu Reeves ao longo dos anos.
# Salve o gráfico no objeto grafico_notas.

# Estrutura do código:
imdb_keanu_reeves <- imdb %>%
  # codígo para manipular da base
  filter(ator_1 == "Keanu Reeves" | ator_2 == "Keanu Reeves" | ator_3 == "Keanu Reeves")

grafico_notas <- imdb_keanu_reeves %>%
  ggplot() +
  # código para gerar o gráfico
  stat_summary(aes(x = ano, y = nota_imdb), geom = "line", fun = "mean")

# c. Faça um histograma do lucro dos filmes
# filmes do Keanu Reeves.
# Salve o gráfico no objeto grafico_lucro.

# Estrutura do código:

grafico_lucro <- imdb_keanu_reeves %>%
  # codígo para manipular da base
  ggplot(aes(x = receita - orcamento)) +
# código para gerar o gráfico
  geom_histogram()

# d. Rode o código abaixo e observe a figura gerada.
library(patchwork)

grafico_notas + grafico_lucro

# e. Por que não poderíamos usar a função
# facet_wrap() para gerar a mesma figura do item (d)?

# Porque estamos sumarizando com geoms diferentes.


