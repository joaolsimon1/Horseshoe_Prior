#Para exemplificar o uso da priori Horseshoe e compará-la com outra priori, vou utilizar o conjunto de dados de altura 
#e peso de um grupo de estudantes universitários. O objetivo é estimar os coeficientes de regressão do modelo linear 
#simples que relaciona altura e peso.

#Antes de começar a modelagem, é importante definir as priors para os coeficientes da regressão. Vou comparar a priori 
#Horseshoe com a priori Laplace.



# Carregar os dados
# Gerar dados fictícios
set.seed(123)
altura <- rnorm(100, 1.7, 0.1)
peso <- 60 + 0.05*altura + rnorm(100, 0, 3)
dados <- data.frame(altura, peso)

# Definir o modelo
modelo <- "peso ~ altura"

# Definir a priori Horseshoe
library(brms)
prior <- prior(horseshoe(0.1), class = "b")

# Rodar o modelo
ajuste1 <- brm(modelo, data = dados, prior = prior)

# Sumário do modelo
summary(ajuste1)

library(rstan)

# Definir a priori Laplace
prior_laplace <- prior(double_exponential(0, 1), class = "b")

# Rodar o modelo
ajuste2 <- brm(modelo, data = dados, prior = prior_laplace)

# Sumário do modelo
summary(ajuste2)




