######## QUESTION 3 ########

# AUXILIARS
# Defining our libraries
library(stats)

# Setting our seed
set.seed(33)


##### BULLET "a" #####

# Defining our alpha and lambda functions, given by the Method of Moments(MoM)
alpha_MoM <- function(muestra, n){
  suma = sum(muestra)
  prom = suma/n
  desv = sum((muestra-prom)**2)
  return((prom**2)/(desv))
}

lambda_MoM <- function(muestra, n){
  suma = sum(muestra)
  prom = suma/n
  desv = sum((muestra-prom)**2)
  return((prom)/(desv))
}

# Abstracting data for each team member
datos <- read.table("/Users/mauva/Documents/ITAM/8vo Semestre/ESTADISTICA MATEMATICA/TAREAS/TAREA2/tarea2.dat")
datos_mau <- datos[11]
datos_aitana <- datos[13]
datos_gianca <- datos[21]

# Calculating using Moments method estimation foe each team member
alpha_MME_mau = alpha_MoM(datos_mau, 30)
lambda_MME_mau = lambda_MoM(datos_mau, 30)

alpha_MME_aitana = alpha_MoM(datos_aitana, 30)
lambda_MME_aitana = lambda_MoM(datos_aitana, 30)

alpha_MME_gianca = alpha_MoM(datos_gianca, 30)
lambda_MME_gianca = lambda_MoM(datos_gianca, 30)

# Displaying results
cat("\n")
cat(sprintf("Method of moments estimation alpha for Mau: %.5f\n", alpha_MME_mau),
    sprintf("Method of moments estimation lambda for Mau: %.5f\n", lambda_MME_mau))
cat("\n")
cat(sprintf("Method of moments estimation alpha for Aitana: %.5f\n", alpha_MME_aitana),
    sprintf("Method of moments estimation lambda for Aitana: %.5f\n", lambda_MME_aitana))
cat("\n")
cat(sprintf("Method of moments estimation alpha for Giancarlo: %.5f\n", alpha_MME_gianca),
    sprintf("Method of moments estimation lambda for Giancarlo: %.5f\n", lambda_MME_gianca))
cat("\n")


##### BULLET "b" #####

################################################### Example to show ###################################################
# Creating simulated data for 1000 observations of Gamma Distribution random variable
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
################################################### End of example ####################################################

# Defining functions to use
likelihood_function <- function(samp, alpha, lambda, n){
  return((((lambda**alpha)/gamma(alpha))**n)*prod(samp)**(alpha-1)*exp(-lambda*sum(samp)))
}

log_likelihoog_function <- function(samp, alpha, lambda, n){
  log(likelihood_function(samp, alpha, lambda, n))
}

# Defining our functions f1 and f2 for Newton-Raphson iteration
f1 <- function(a) -n*digamma(a)-n*log(mean(x))+n*log(a)+sum(log(x))
f2 <- function(a) -n*trigamma(a)+n/a

# Defining initial guess for alpha, based on our calculations by "3.a bullet"
x0_mau <- alpha_MME_mau
x0_aitana <- alpha_MME_aitana
x0-gianca <- alpha_MME_gianca
iters <- 50

# Implementing Numerical method: Newton-Raphson iterations
for(i in 1:iters)
  x0 <- x0 - f1(x0)/f2(x0)

# Defining alpha_hat
alpha_hat <- x0

# Estimating that the maximum Likelihood Estimate of Lambda was found to be alpha_hat
lambda_hat <- alpha_hat/x_bar
lambda_hat


##### BULLET "c" #####
