# Controle de fluxo -------------------------------------------------------

# É muito comum usarmos operadores lógicos para fazer os nossos códigos tomarem decisões.
# Para isso, utilizamos os controladores de fluxo.

# if: faz uma ação se a condição for atendida

x <- 1
if(x == 1) {         
  Sys.time()    
}

# if/else: faz uma ação se a primeira condição for atendida, uma segunda ação se a segunda condição for atendida, e assim por diante.

x <- 0

if(x < 0){
  "negativo"
} else {
  "não negativo"
}

# else-if: generaliza o comportamento do if

if(x < 0) {
  "negativo"
} else if(x == 0) {
  "neutro"
} else {
  "positivo"
}

# for: realiza uma operação repetidamente dentro de um escopo

for(i in 1:10){
  texto <- paste0("Esse aqui é o número ", i)
  print(texto)
}

# podemos juntar for's e if's! isso é muito comum, inclusive

for(i in 1:10) {
  if(i %% 2 != 0) {
    texto <- paste0("Essa é a repetição ", i, "!")
    print(texto)
  }
}

# Exercícios --------------------------------------------------------------

x <- c(10, 3, 5, 1, 3, 4, 8, 9, 10)

# 1. Crie um laço com for que imprima as médias acumuladas do vetor x.
# Isso é, primeiro vamos imprimir 10, depois (10+3)/2, depois (10+3+5)/3, etc.

# 2. Adapte o laço que você fez no exercício 1 para imprimir a média acumulada só quando essas médias forem maior do que 5.
