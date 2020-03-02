# Passo 0: Carregar pacotes

library(tidyverse)

# Passo 1: Fazer contas

media_de_mpg <- mean(mtcars$mpg)

# Passo 2: Escrever resultado em arquivo

write(media_de_mpg, file = "media_de_mpg.txt")
