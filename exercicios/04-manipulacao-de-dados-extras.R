# Exercícios extras de dplyr ######################################################################################
# Para os exercícios, instale o pacote "nycflights13" (lembre-se que basta instalar uma única vez e nunca mais!)

library(nycflights13)

# Traduz os nomes do ingles para o portugues...
voos <- flights %>%
  rename(
    ano = year,
    mes = month,
    dia = day,
    hora_da_decolagem = dep_time,
    hora_do_pouso = arr_time,
    hora_do_pouso_prevista = sched_arr_time,
    atraso = arr_delay,
    cia_aerea = carrier,
    numero_do_voo = flight,
    codigo_do_voo = tailnum,
    origem = origin,
    destino = dest,
    hora = hour,
    minuto = minute,
    data_hora = time_hour
  )

cias_aereas <- airlines %>%
  rename(
    cia_aerea_cod = carrier,
    cia_aerea_nome = name
  )

# Selecione apenas as colunas que importam: ano, mes, dia, origem, destino, codigo_do_voo e cia_aerea.
# Salve num objeto novo, chamado voo2.
voos2 <- voos


