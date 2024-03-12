# 1) DETERMINISTIC
#
# Defining the functions:

stirling_approx <- function(n){
  
  sti_aprox <- sqrt(2 * pi * n) * (n)^n * (exp(1))^(-n)
  
  return(sti_aprox)
  
}

difference <- function(n){
  
  dif <- factorial(n) - stirling_approx(n)
  
  return(dif)
  
}

relative_diference <- function(n){
  
  rel_dif <- (difference(n) / factorial(n))
  
  return(rel_dif)
  
}

# Executing
#

n_values <- 1:12
for(n in n_values){
  # Calculating factorial
  a <- factorial(n)
  
  # Using our stirling aproximation function
  b <- stirling_approx(n)
  
  # Calculating the difference
  c <- difference(n)
  
  # Calculating the relative difference 
  d <- relative_diference(n)
  
  # Printing
  cat("n value: ", n)
  cat("\n")
  cat(sprintf("Factorial: %.0f\n", a),sprintf("Stirling approximation: %.5f\n", b), 
      sprintf("Difference: %.5f\n", c), sprintf("Realtive Difference: %.5f\n", d))
  cat("\n")
  
}


# II) SIMULATION
#
# Runnig the providing code

#set.seed(20240208)
N <- 20000
x <- rgamma(N, shape=2, scale=1)
out <- hist(x, xlab="observations", ylab="frecuency", main="Gamma Distribution")


# III) Approximation error
#
# Executing

# Defining our seed and realizations number
set.seed(12345)

# Defining our variables
K <- 51
N <- 10000
n <- 25

# Setting our sucess probability and the complement
p <- 0.5
q <- 1-p

# Calculating mean
mu <- (1-p)/p

# calculating standard deviation
sigma <- (1-p)/p^2

# Defining vector to keep mean of each sample
xbar <- rep(NA,N)

# Calculating the sample mean ans storing in the deined vector
for(i in seq(N)) {
  x <- rgeom(n, p)
  xbar[i] <- mean(x)
}

# Creating a sequence that spans from the min to the max into K equal intervals
x <- seq(min(xbar), max(xbar), length=K)

# Defining our histogram
tt <- hist(xbar, prob=TRUE, main="")

# Defining the plot title
lab <- substitute("Gometric Distribution: p="*p, list(p=p))
title(lab)

# Calcultaing the density of a normal distribution 
f1 <- dnorm(x, mean=mean(xbar), sd=sd(xbar))

# Adding a line to the existing histogram
lines(x,f1, lwd=2, col=4)

# calculating the observed probabilities for each bin
p.obs <- tt$density*(tt$breaks[2]-tt$breaks[1])

# Calculating the theorical probabilities for each bin, based on the normal distribution specified
p.teo <- as.numeric(diff(pnorm(tt$breaks, mean=mean(xbar), sd=sd(xbar))))

# Computing the total absoulte error between the observed and theorical probabilties
cat("\nError_1: ",error <- sum(abs(p.obs-p.teo)))

# Setting legend
legend("topleft", legend=paste("Error = ",round(error,4)))

