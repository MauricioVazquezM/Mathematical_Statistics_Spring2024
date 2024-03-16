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
n <- 30
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
likelihood_function <- function(samp, alpha, lambda){
  return((((lambda**alpha)/gamma(alpha))**n)*prod(samp)**(alpha-1)*exp(-lambda*sum(samp)))
}

log_likelihood_function <- function(samp, alpha, lambda){
  log(likelihood_function(samp, alpha, lambda))
}

# Defining our functions f1 and f2 for Newton-Raphson iteration
# This f1 function is the first partial derivative of log_likelihood function respective to alpha 
f1 <- function(alpha,samp) -n*digamma(alpha)-n*log(mean(samp))+n*log(alpha)+sum(log(samp))
# This f1 function is the second partial derivative of log_likelihood function respective to alpha 
f2 <- function(alpha, samp) -n*trigamma(alpha)+n/alpha

# Defining number of iterations
iters <- 5

# Defining initial guess for alpha, based on our calculations by "3.a bullet"
x0_mau <- alpha_MME_mau
x0_aitana <- alpha_MME_aitana
x0_gianca <- alpha_MME_gianca

# Implementing Numerical method: Newton-Raphson iterations
for(i in 1:iters){
  
  x0_mau <- x0_mau - f1(x0_mau, datos_mau$X191686)/f2(x0_mau, datos_mau$X191686)
  
  }

for(i in 1:iters){
  
  x0_aitana <- x0_aitana - f1(x0_aitana, datos_aitana$X194674)/f2(x0_aitana, datos_aitana$X194674)
  
  }

for(i in 1:iters){
  
  x0_gianca <- x0_gianca - f1(x0_gianca, datos_gianca$X200672)/f2(x0_gianca, datos_gianca$X200672)
  
  }

# Defining x_bar for each team member
x_bar_mau <- mean(datos_mau$X191686)
x_bar_aitana <- mean(datos_aitana$X194674)
x_bar_gianca <- mean(datos_gianca$X200672)

# Defining alpha_hat for each team member
alpha_MLE_mau <- x0_mau
alpha_MLE_aitana <- x0_aitana
alpha_MLE_gianca <- x0_gianca

# Estimating that the maximum Likelihood Estimate of Lambda was found to be alpha_hat
lambda_MLE_mau <- alpha_MLE_mau/x_bar_mau
lambda_MLE_aitana <- alpha_MLE_aitana/x_bar_aitana
lambda_MLE_gianca <- alpha_MLE_gianca/x_bar_gianca

# Displaying results of alpha and lambda
cat("Number of iterations: ", iters)
cat("\n")
cat(sprintf("Maximum Likelihood Estimation alpha for Mau: %.5f\n", alpha_MLE_mau),
    sprintf("Maximum Likelihood Estimation lambda for Mau: %.5f\n", lambda_MLE_mau))
cat("\n")
cat(sprintf("Maximum Likelihood Estimation alpha for Aitana: %.5f\n", alpha_MLE_aitana),
    sprintf("Maximum Likelihood Estimation lambda for Aitana: %.5f\n", lambda_MLE_aitana))
cat("\n")
cat(sprintf("Maximum Likelihood Estimation alpha for Giancarlo: %.5f\n", alpha_MLE_gianca),
    sprintf("Maximum Likelihood Estimation lambda for Giancarlo: %.5f\n", lambda_MLE_gianca))
cat("\n")

# Calculating differences between Newton-Raphson iterations
like_mau <- likelihood_function(datos_mau$X191686, alpha_MLE_mau, lambda_MLE_mau)
like_aitana <- likelihood_function(datos_aitana$X194674, alpha_MLE_aitana, lambda_MLE_aitana)
like_gianca <- likelihood_function(datos_gianca$X200672, alpha_MLE_gianca, lambda_MLE_gianca)

log_like_mau <- log_likelihood_function(datos_mau$X191686, alpha_MLE_mau, lambda_MLE_mau)
log_like_aitana <- log_likelihood_function(datos_aitana$X194674, alpha_MLE_aitana, lambda_MLE_aitana)
log_like_gianca <- log_likelihood_function(datos_gianca$X200672, alpha_MLE_gianca, lambda_MLE_gianca)

# Displaying results
cat("Number of iterations: ", iters)
cat(sprintf("Likelihood Function Estimation for Mau: %.5e\n", like_mau),
    sprintf("Log Likelihood Function Estimation for Mau: %.5f\n", log_like_mau))
cat(sprintf("Likelihood Function Estimation for Aitana: %.5e\n", like_aitana),
    sprintf("Log Likelihood Function Estimation for Aitana: %.5f\n", log_like_aitana))
cat(sprintf("Likelihood Function Estimation for Gianca: %.5e\n", like_gianca),
    sprintf("Log Likelihood Function Estimation for Gianca: %.5f\n", log_like_gianca))
cat("\n")

##### BULLET "c" #####


