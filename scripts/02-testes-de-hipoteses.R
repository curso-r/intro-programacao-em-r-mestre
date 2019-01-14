# Teste de médias ---------------------------------------------------------

mtcars
View(mtcars)
help(mtcars)

t.test(mpg ~ vs, mtcars)

teste <- t.test(mpg ~ am, mtcars)

names(teste)
teste$p.value


# Teste de proporções -----------------------------------------------------

data("credit_data", package = "recipes")

View(credit_data)

tabela <- table(credit_data$Records, credit_data$Status)
  
prop.test(tabela)

tabela <- table(credit_data$Marita, credit_data$Status)
prop.test(tabela)


# Teste qui-quadrado ------------------------------------------------------

# Aderência

titanic <- tibble::as.tibble(datasets::Titanic)
View(titanic)

tabela <- c(
  sum(titanic$n[titanic$Sex == "Male" & titanic$Survived == "Yes"]),
  sum(titanic$n[titanic$Sex == "Female" & titanic$Survived == "Yes"])
)

chisq.test(tabela)
chisq.test(tabela, p = c(0.8, 0.2))

# Contingência

tabela <- table(credit_data$Records, credit_data$Status)

chisq.test(tabela)

View(credit_data)

table(credit_data$Marital, credit_data$Home) %>% chisq.test()

# Teste de Dunnett --------------------------------------------------------

# Queremos comparar vários tratamentos com um único controle

library(multcomp)

dados <- as.data.frame(datasets::ChickWeight)
View(dados)

dados_desfecho <- dados[dados$Time == 18, ]

ajuste <- aov(weight ~ Diet, dados_desfecho)

Dunnet <- glht(ajuste, linfct = mcp(Diet = "Dunnett"))
summary(Dunnet)

as.numeric(c("a", "b", "a", "b"))

as.numeric(factor(c("a", "b", "a", "b")))

# Teste de Tukey ---------------------------------------------------------

Tukey <- TukeyHSD(ajuste)
Tukey

# Teste de correlação -----------------------------------------------------

data("diamonds", package = "ggplot2")

View(diamonds)

cor(diamonds$carat, diamonds$price)
cor.test( ~ carat + price, data = diamonds)
