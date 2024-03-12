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