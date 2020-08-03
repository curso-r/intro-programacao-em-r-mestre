# Exercícios - Introdução ao R


# objetos -----------------------------------------------------------------
# (a) Crie um vetor com o nome de tres frutas e guarde em um objeto chamado frutas.
# (b) Use a função length() para contar o tamanho do vetor. Certifique-se que retorna 3.
# (c) Use [] para retornar a primeira fruta do vetor.
# (d) Inspecione a saída de 'paste("eu gosto de", frutas)' e responda se o tamanho do vetor mudou.

# data.frames -------------------------------------------------------------
# Use o data.frame airquality para responder às questões abaixo:
# (a) quantas colunas airquality tem?
# (b) quantas linhas airquality tem?
# (c) o que a função head() retorna?
# (d) quais são os nomes das colunas?
# (e) qual é a classe da coluna Ozone? Dicas: class() e '$'
# (f) o que o código 'dplyr::glimpse(airquality) retorna?
# (g) utilizando a resposta da (f), quais são os tipos de
#     cada coluna da tabela airquality?

# vetores e funcoes ---------------------------------------------------------
# Analise as duas linhas de códigos abaixo:
c(1,2,3) - 1           # código 1
c(1,2,3) - c(1,1,1)    # código 2
# Os resultados são iguais? Porquê?

# Considere o vetor booleano abaixo:
dolar_subiu <- c(TRUE, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE)
# este vetor tem informação de uma semana (7 dias) indicando se o dolar subiu (TRUE)
# (ou não subiu - FALSE) no respectivo dia. Interprete os números abaixo:
# (a) length(dolar_subiu)
# (b) dolar_subiu[2]  (ps: a semana começa no domingo)
# (c) sum(dolar_subiu)
# (d) mean(dolar_subiu)

# Agora observe a saída de as.numeric(dolar_subiu). O que o R fez?


# [desafio] Use o data.frame airquality para responder às questões abaixo:
# Vamos calcular o desvio padrão de Ozone sem usar a função sd().
# Dica: guarde os resultados de cada item em objetos para poderem ser usados depois.
# (a) tire a média da coluna Ozone. Dica: use mean(x, na.rm = TRUE).
# (b) subtraia da coluna Ozone a sua própria média (centralização).
# (c) eleve o vetor ao quadrado.
# (d) tire a média do vetor.
# (e) tire a raíz quadrada.
# (f) compare o resultado com sd(airquality$Ozone)


# funcoes proprias ---------------------------------------------------------
# Crie uma função que receba um número e retorne o quadrado deste
# número.

# [desafio] Crie uma função que recebe 2 números x e y
# e devolve a raiz quadrada da soma desses números.
# Depois teste a função para valores (x=2, y=3).
# Dica: sqrt() é a função para raiz quadrada.


# filtro e vetores logicos ------------------------------------------------

# use o vetor numeross abaixo para responder as questoes seguintes.
numeross <- -4:2

# (a) Escreva um código que devolva apenas valores positivos do vetor numeross.
# (b) Escreva um código que devolta apenas os valores pares
#     do vetor numeross.
#     Dica: o operador %% devolve o resto da divisão entre dois números
# (c) Filtre o vetor para que retorne apenas aqueles valores que quando
#     elevados a 2 são menores do que 4.


# Use o data.frame airquality para responder às questões abaixo
# (a) conte quantos NAs tem na coluna Solar.R. Dica: use '$', is.na() e sum()
# (b) filtre a tabela airquality com apenas linhas em que Solar.R é NA.
# (c) filtre a tabela airquality com apenas linhas em que Solar.R NÃO é NA.
# (d) filtre a tabela airquality com apenas linhas em que Solar.R NÃO é NA e Month é igual a 5.

