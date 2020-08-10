library(tidyverse)

# para pegar os dados -------------------
# install.packages("likert")
data("gap", package = "likert")
gap_long <- gap %>%
  tidyr::pivot_longer(-StudentId, names_to = "questao", values_to = "resposta")

# Use o gap_long para fazer os exercícios.
# PS: pivot_longer() é uma funcao que "derrete" o banco de dados, empilhando as colunas.
# vale a pena estudar o que essa funcao faz. Ela geralmente vai bem com ggplot2().

# 1) crie uma tabela com a contagem de cada resposta para cada questao.

tabela <- gap_long %>%
  count(questao, resposta) 

# 2) Usando a tabela acima, faca um grafico com uma barra horizontal para cada questao e 
# com as contagens no eixo X. Pinte o preenchimento das barras representando as respostas (fill).
tabela %>%
  ggplot() +
  geom_col(aes(x = n, y = questao, fill = resposta))
grafico

# 3) [avancado] Mexendo com as categorias e as cores:
# a) transforme a coluna 'resposta' em factor() no mutate().  
# b) adicione  + scale_fill_brewer(palette = "RdBu") no grafico.
# c) observe se uma escala indo de azul ao vermelho apareceu.
tabela %>%
  mutate(resposta = factor(resposta)) %>%
  ggplot() +
  geom_col(aes(x = n, y = questao, fill = resposta)) + 
  scale_fill_brewer(palette = "RdBu") 


