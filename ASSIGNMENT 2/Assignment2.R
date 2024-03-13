# Defining our libraries
library(stats)

# Setting our seed
set.seed(33)

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

# Implementing Numerical method: Newton-Raphson iterations
for(i in 1:iters)
  x0 <- x0 - f1(x0)/f2(x0)

# Defining alpha_hat
alpha_hat <- x0

# Estimating that the maximum Likelihood Estimate of Lambda was found to be alpha_hat
lambda_hat <- alpha_hat/x_bar
lambda_hat