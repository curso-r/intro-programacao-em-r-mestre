
library(tidyverse)

# Caminhos até o arquivo --------------------------------------------------

# 1. Podem ser absolutos
"/home/william/Documents/Curso-R/intro-programacao-em-r-mestre/dados/imdb.csv"

# 2. Podem ser relativos ao diretório de trabalho
getwd()

# Principais formatos -----------------------------------------------------

# Arquivos de texto
imdb <- read_csv(file = "dados/imdb.csv")
imdb2 <- read_delim("dados/imdb2.csv", delim = ";")

# Excel
library(readxl)
imdb_excel <- read_excel("dados/imdb.xlsx")

# SQL ---------------------------------------------------------------------

conexao <- src_sqlite("dados/imdb.sqlite", create = TRUE)
# copy_to(conexao, imdb, temporary = FALSE)

imdb_sqlite <- tbl(conexao, "imdb")
imdb_select <- tbl(conexao, sql("SELECT titulo, ano, diretor FROM imdb"))

# trazer para a memória
collect(imdb_sqlite)
collect(imdb_select)

# db.rstudio.com

# Outros formatos ---------------------------------------------------------

library(jsonlite)
imdb_json <- read_json("dados/imdb.json")

library(haven)

imdb_sas <- read_sas("dados/imdb.sas7bdat")
imdb_spss <- read_spss("dados/imdb.sav")

# pacote rio
library(rio)
imdb_rio <- rio::import("dados/imdb.xlsx")

# data.table
library(data.table)
imdb_dt <- fread("dados/imdb.csv")