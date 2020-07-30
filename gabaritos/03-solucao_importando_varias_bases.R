# passo 1: abriria o primeiro arquivo (1916): arquivo principal

# passo 2: abrir o próximo arquivo (1917)

# passo 3: copiar a base desse arquivo

# passo 4: colar a base no arquivo principal

# passo 5: repetir os passos 2 a 4 para todas as outras bases


library(tidyverse)

# Solução 1

base_principal <- read_rds("dados/por_ano/imdb_1916.rds")

arquivos <- list.files(path = "dados/por_ano/", full.names = TRUE)

for (arq in arquivos[-2]) {
  tab <- readxl::read_excel(arq)
  base_principal <- rbind(base_principal, tab)
}

base_principal



# Solução 2

base_principal <- tibble()

arquivos <- list.files(path = "dados/por_ano/", full.names = TRUE)

for (arq in arquivos) {
  tab <- read_rds(arq)
  base_principal <- rbind(base_principal, tab)
}

base_principal

# Solução 3

base_principal <- tibble()

arquivos <- list.files(path = "dados/por_ano/", full.names = TRUE)

num_arquivos <- length(arquivos)

for (i in 1:num_arquivos) {
  tab <- read_rds(arquivos[i])
  base_principal <- rbind(base_principal, tab)
}

base_principal

# Solução 4

arquivos <- list.files(path = "dados/por_ano/", full.names = TRUE)

base_principal <- arquivos %>% 
  purrr::map(read_rds) %>% 
  bind_rows()

# Solução 4 (melhor)

arquivos <- list.files(path = "dados/por_ano/", full.names = TRUE)

base_principal <- arquivos %>% 
  purrr::map_dfr(read_rds)





