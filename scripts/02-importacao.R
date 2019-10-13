library(tidyverse)

# Caminhos até o arquivo --------------------------------------------------

# 1. Podem ser absolutos
"/home/william/Documents/Curso-R/intro-programacao-em-r-mestre/dados/imdb.csv"

# 2. Podem ser relativos ao diretório de trabalho
getwd()

# exercício: na linha debaixo, abram aspas e apertem TAB.

# LEITURA DE DADOS --------------------------------------------------------
# Principais formatos -----------------------------------------------------

# Arquivos de texto
imdb <- read_csv(file = "dados/imdb.csv")
imdb2 <- read_delim("dados/imdb2.csv", delim = ";")

# Excel
library(readxl)
imdb_excel <- read_excel("dados/imdb.xlsx", sheet = 1:2)

meu_bd <- read_fwf(file = "dados/imdb.csv", col_positions = c(3, 6, 10, 100))
names(meu_bd) <- c("coluna 1", "preco", "nome do cliente", "data")


# SQL ---------------------------------------------------------------------
install.packages("RSQLite")
conexao <- src_sqlite("dados/imdb.sqlite", create = TRUE)
# copy_to(conexao, imdb, temporary = FALSE)

imdb_sqlite <- tbl(conexao, "imdb")
imdb_select <- tbl(conexao, sql("SELECT titulo, ano, diretor FROM imdb"))

# trazer para a memória
collect(imdb_sqlite)
collect(imdb_select)
DBI::dbSendQuery(conexao, "use meuSchema")
copy_to(conexao, imdb)

# db.rstudio.com

# Outros formatos ---------------------------------------------------------

library(jsonlite)
imdb_json <- read_json("dados/imdb.json")

library(haven)

imdb_sas <- read_sas("dados/imdb.sas7bdat")
imdb_spss <- read_spss("dados/imdb.sav")

# data.table
library(data.table)
imdb_dt <- fread("dados/imdb.csv")


# GRAVANDO DADOS ------------------------------------------------------------
# funcoes que iniciam com 'write'
# csv
write_csv(imdb, path = "dados/imdb.csv")

# Excel
library(writexl)
write_xlsx(imdb_excel, path = "dados/imdb.xlsx")
