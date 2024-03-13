######## QUESTION 3 ########

# AUXILIARS
# Defining our libraries
library(stats)

# Setting our seed
set.seed(33)


##### BULLET "a" #####

# Defining our 
alpha <- function(muestra, n){
  suma = sum(muestra)
  prom = suma/n
  desv = sum((muestra-prom)**2)
  return((prom**2)/(desv))
}

lamda <- function(muestra, n){
  suma = sum(muestra)
  prom = suma/n
  desv = sum((muestra-prom)**2)
  return((prom)/(desv))
}

# Abstracting data for each team member
datos <- read.table("/Users/mauva/Documents/ITAM/8vo Semestre/ESTADISTICA MATEMATICA/TAREAS/TAREA2/tarea2.dat")
datos_mau <- datos[1]
datos_aitana <- datos[2]
datos_gianca <- datos[3]

# Calculating using Moments method estimation foe each team member
alpha_MME_mau = alpha(datos_mau, 30)
lambda_MME_mau = lamda(datos_mau, 30)

alpha_MME_aitana = alpha(datos_aitana, 30)
lambda_MME_aitana = lamda(datos_aitana, 30)

alpha_MME_gianca = alpha(datos_gianca, 30)
lambda_MME_gianca = lamda(datos_gianca, 30)

# Displaying results
cat("\n")
cat(sprintf("Method of moments estimation alpha for Mau: %.5f\n", alpha_MME_mau),
    sprintf("Method of moments estimation lambda for Mau: %.5f\n", lambda_MME_mau))
cat("\n")
cat("\n")
cat(sprintf("Method of moments estimation alpha for Aitana: %.5f\n", alpha_MME_aitana),
    sprintf("Method of moments estimation lambda for Aitana: %.5f\n", lambda_MME_aitana))
cat("\n")
cat("\n")
cat(sprintf("Method of moments estimation alpha for Giancarlo: %.5f\n", alpha_MME_gianca),
    sprintf("Method of moments estimation lambda for Giancarlo: %.5f\n", lambda_MME_gianca))
cat("\n")

##### BULLET "b" #####

# Example to show
# Creating simulated data for 1000 observations of Gamma Distributin random variable
sampleData <- rgamma(n = 1000, shape = 2, rate = 0.2)

# Taking the sample mean of the simulated data
x_bar <- mean(sampleData)
x_bar

# Taking the natural logarithm of each of the values in the sampleData
ln_Sample <- log(sampleData)
head(ln_Sample)

# Getting the mean of the natural log of sample data
mean_ln_sample <- mean(ln_Sample)
mean_ln_sample

# Writting the function that corresponds to the partial derivative of log-likelihood function with respect alpha
f <- function(x){
  log(x) - digamma(x) - log(x_bar) + mean_ln_sample
}

# Just to show: Plotting curves of log-likelihood function derivative with respect to alpha
curve(f, from=0, to=5)
abline(h=0)

curve(f, from=1, to=3)
abline(h=0)

curve(f, from=2, to=2.5)
abline(h=0)

# Defining initial guess for alpha, based on our calculations by "3.a bullet"
x0 <- 1
iters <- 50

# Defining our functions f1 and f2
f1 <- function(y)
f2 <- function(y)

# Implementing Numerical method: Newton-Raphson iterations
for(i in 1:iters)
  x0 <- x0 - f1(x0)/f2(x0)

# Defining alpha_hat
alpha_hat <- x0

# Estimating that the maximum Likelihood Estimate of Lambda was found to be alpha_hat
lambda_hat <- alpha_hat/x_bar
lambda_hat