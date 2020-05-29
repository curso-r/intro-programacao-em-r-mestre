
# Carregar pacotes --------------------------------------------------------

library(tidyverse)

# Ler base IMDB -----------------------------------------------------------

imdb <- read_rds("dados/imdb.rds")

imdb <- imdb %>% mutate(lucro = receita - orcamento)


# Filosofia ---------------------------------------------------------------

# Um gráfico estatístico é uma representação visual dos dados 
# que utiliza os atributos estéticos (posição, cor, forma, 
# tamanho, ...) de formas geométricas (pontos, linhas,
# barras, ...).

# Layered grammar of graphics: cada elemento do 
# gráfico pode ser representado por uma camada e 
# um gráfico seria a sobreposição dessas camadas.

# Gráfico de pontos (dispersão) -------------------------------------------

# Gráfico de dispersão da receita contra o orçamento
ggplot(imdb) +
  geom_point(mapping = aes(x = orcamento, y = receita))

# Inserindo a reta x = y
imdb %>%
  ggplot() +
  geom_point(mapping = aes(x = orcamento, y = receita)) +
  geom_abline(intercept = 0, slope = 1, color = "red")

# Observe como cada elemento é uma camada do gráfico.
# Agora colocamos a camada da linha antes da camada
# dos pontos.
imdb %>%
  ggplot() +
  geom_abline(intercept = 0, slope = 1, color = "red") +
  geom_point(mapping = aes(x = orcamento, y = receita))

# Atribuindo a variável lucro aos pontos
imdb %>%
  ggplot() +
  geom_point(mapping = aes(x = orcamento, y = receita, color = lucro))

# Categorizando o lucro antes
imdb %>%
  mutate(
    lucrou = ifelse(lucro <= 0, "Não", "Sim")
  ) %>%
  ggplot() +
  geom_point(mapping = aes(x = orcamento, y = receita, color = lucrou))


# Exercícios --------------------------------------------------------------

# a. Crie um gráfico de dispersão da nota do imdb pelo orçamento.

# b. Pinte todos os pontos do gráfico de azul.

# Gráfico de linhas -------------------------------------------------------

# Média dos filmes ao longo dos anos

imdb %>% 
  group_by(ano) %>% 
  summarise(nota_media = mean(nota_imdb, na.rm = TRUE)) %>% 
  ggplot() +
  geom_line(aes(x = ano, y = nota_media))

# Número de filmes coloridos e preto e branco por ano 

imdb %>% 
  filter(!is.na(cor)) %>% 
  group_by(ano, cor) %>% 
  summarise(num_filmes = n()) %>% 
  ggplot() +
  geom_line(aes(x = ano, y = num_filmes, color = cor))

# Nota média do Spielberg por ano
imdb %>% 
  filter(ator_1 == "Robert De Niro") %>% 
  group_by(ano) %>% 
  summarise(nota_media = mean(nota_imdb, na.rm = TRUE)) %>% 
  ggplot() +
  geom_line(aes(x = ano, y = nota_media))

# Colocando pontos no gráfico
imdb %>% 
  filter(ator_1 == "Robert De Niro") %>% 
  group_by(ano) %>% 
  summarise(nota_media = mean(nota_imdb, na.rm = TRUE)) %>% 
  ggplot() +
  geom_line(aes(x = ano, y = nota_media)) +
  geom_point(aes(x = ano, y = nota_media))

# Reescrevendo de uma forma mais agradável
imdb %>% 
  filter(ator_1 == "Robert De Niro") %>% 
  group_by(ano) %>% 
  summarise(nota_media = mean(nota_imdb, na.rm = TRUE)) %>% 
  ggplot(aes(x = ano, y = nota_media)) +
  geom_line() +
  geom_point()

# Colocando as notas no gráfico
imdb %>% 
  filter(ator_1 == "Robert De Niro") %>% 
  group_by(ano) %>% 
  summarise(nota_media = mean(nota_imdb, na.rm = TRUE)) %>% 
  mutate(nota_media = round(nota_media, 1)) %>% 
  ggplot(aes(x = ano, y = nota_media)) +
  geom_line() +
  geom_label(aes(label = nota_media))


# Gráfico de barras -------------------------------------------------------

# Número de filmes dos diretores da base
imdb %>% 
  count(diretor) %>%
  top_n(10, n) %>%
  ggplot() +
  geom_bar(aes(x = diretor, y = n), stat = "identity")

# Tirando NA e pintando as barras
imdb %>% 
  count(diretor) %>%
  filter(!is.na(diretor)) %>% 
  top_n(10, n) %>%
  ggplot() +
  geom_bar(
    aes(x = diretor, y = n, fill = diretor), 
    stat = "identity",
    show.legend = FALSE
  )

# Invertendo as coordenadas
imdb %>% 
  count(diretor) %>%
  filter(!is.na(diretor)) %>% 
  top_n(10, n) %>%
  ggplot() +
  geom_bar(
    aes(x = diretor, y = n, fill = diretor), 
    stat = "identity",
    show.legend = FALSE
  ) +
  coord_flip()
  

# Ordenando as barras
imdb %>% 
  count(diretor) %>%
  filter(!is.na(diretor)) %>% 
  top_n(10, n) %>%
  mutate(
    diretor = forcats::fct_reorder(diretor, n)
  ) %>% 
  ggplot() +
  geom_bar(
    aes(x = diretor, y = n, fill = diretor), 
    stat = "identity",
    show.legend = FALSE
  ) +
  coord_flip()

# Colocando label nas barras
imdb %>% 
  count(diretor) %>%
  filter(!is.na(diretor)) %>% 
  top_n(10, n) %>%
  mutate(
    diretor = forcats::fct_reorder(diretor, n)
  ) %>% 
  ggplot() +
  geom_bar(
    aes(x = diretor, y = n, fill = diretor), 
    stat = "identity",
    show.legend = FALSE
  ) +
  geom_label(aes(x = diretor, y = n/2, label = n)) +
  coord_flip()


# Histogramas e boxplots --------------------------------------------------



# Título e labels ---------------------------------------------------------





