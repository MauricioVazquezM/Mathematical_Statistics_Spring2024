################################################### QUESTION 2 ###################################################

#### Loading library
library(stats)

############ A. NORM DISTRIBUTION ############

## Defining sigmas and confidence intervals vectors
sigmas <- c(1.0,2.0,5.0)
confidence_intervals <- c(0.90, 0.95, 0.99)

## Creating function for easy usage
normal_table_function <- function(sigmas_vector, conf_int_vector){
  
  ## Defining list to store outputs
  normal_table <- list()
  
  ## Iterating over each sigma value 
  for (sig in sigmas_vector) {
    
    ## Iterating over each confidence interval value we have
    for (ci in conf_int_vector){
      
      ## Defining alpha
      alpha <- 1 - ci
      
      ## Calculating quantiles for tails
      z_low <- qnorm(alpha/2)
      z_upp <- qnorm(1 - alpha/2)
      
      ## Calculating limits
      limit_inf <- z_low * sig
      limit_upp <- z_upp * sig
      
      ## Calculating w value (Difference between upper limit and lower limit)
      w <- limit_upp - limit_inf
      
      ## Storing on the table
      normal_table[[length(normal_table) +1]] <- list(sigma = sig, CI = ci, qi = limit_inf, qs = limit_upp, w = w)
      
    }
    
  }
  
  return(normal_table)
  
}

# Using our function 
norm_ta <- normal_table_function(sigmas, confidence_intervals)

# Visualizing results
print(norm_ta)

############ B. CHI-SQUARE ############

## Defining sigmas and confidence intervals vectors
degreesF_vector <- c(5, 10, 15)
confidence_intervals <- c(0.90, 0.95, 0.99)

## Creating function for easy usage
chi_table_function_SWtails <- function(n_vector, conf_int_vector){
  
  ## Defining list to store outputs
  chi_table <- list()
  
  ## Iterating over each sigma value 
  for (n in n_vector) {
    
    ## Iterating over each confidence interval value we have
    for (ci in conf_int_vector){
      
      ## Defining alpha
      alpha <- 1 - ci
      
      ## Calculating quantiles for tails
      z_low <- qchisq(alpha/2, n)
      z_upp <- qchisq(1 - alpha/2, n)
      
      ## Calculating limits
      limit_inf <- z_low 
      limit_upp <- z_upp 
      
      ## Calculating w value (Difference between upper limit and lower limit)
      w <- limit_upp - limit_inf
      
      ## Storing on the table
      chi_table[[length(chi_table) +1]] <- list(Degrees_of_freedom = n, CI = ci, qi = limit_inf, qs = limit_upp, w = w)
      
    }
    
  }
  
  return(chi_table)
  
}

# Using our function 
chi_ta <- chi_table_function_SWtails(degreesF_vector, confidence_intervals)

# Visualizing results
print(chi_ta)