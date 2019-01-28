calcula_nota <- function(file) {
  
  parcial <- 0
  source(file)
  
  # Ex 1
  parcial <- parcial + ifelse(near(res1(1:42),0.5705974), 1.5, 0)
  res1_ <- purrr::possibly(res1, otherwise = TRUE)
  parcial <- parcial + ifelse(is.na(res1_(1)), 0, ifelse(res1_(1), 0.5, 0))
  parcial <- parcial + ifelse(is.na(res1_("a")), 0, ifelse(res1_("a"), 0.5, 0))
  
  # Ex 2
  res2_ <- readRDS("dados/res2.rds")
  res2_cols <- res2 %>% names() %>% sort()
  res2_cols_ <- res2_ %>% names() %>% sort()
  parcial <- parcial + ifelse(all.equal(res2_cols, res2_cols_), 1, 0)
  parcial <- parcial + ifelse(all.equal(res2$receita, res2_$receita), 1.5, 0)
  
  # Ex 3
  res3_ <- readRDS("dados/res3.rds")
  res3_cols <- res3 %>% names() %>% sort()
  res3_cols_ <- res3_ %>% names() %>% sort()
  parcial <- parcial + ifelse(all.equal(res3_cols, res3_cols_), 1, 0)
  parcial <- parcial + 
    ifelse(all.equal(res3$nota_imdb_cat, res3_$nota_imdb_cat), 1.5, 0)
  
  # Ex 4
  parcial <- parcial + ifelse(res4 == "c", 2.5, 0)
  
  nota <- tibble(nome = nome, nota = parcial)
  
  return(nota)
  
}

file <- "scripts/06-avaliacao.R"

calcula_nota(file)
