# Na pasta "dados/por_ano/" temos a base IMDB com cada ano em um arquivo. Não é raro recebermos bases com essa configuração. O trabalho que teríamos para empilhar todas as bases manualmente seria imenso, ainda bem que com o R conseguimos fazer isso com apenas algumas linhas de código.
#
# Nesta atividade:
#  
# 1. Leia a seção 3.12 do livro da Curso-R sobre Controle de fluxos: https://livro.curso-r.com/3-12-controle-de-fluxo.html
#
# 2. Construa um script em R para ler em empilhar as bases contidas na pasta dados/por_ano/ no material do curso.
#
# Dicas:
#  
# - Você vai precisar usar um for.
# - Use a função list.files() para pegar o nome de todos os arquivos de uma pasta.
# - Use a função rbind() para empilhar bases.