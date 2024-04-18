################################################### QUESTION 2 ###################################################

#### Loading library
library(stats)
library(optimx)

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


## B.1
## Defining sigmas and confidence intervals vectors
degreesF_vector <- c(5, 10, 20)
confidence_intervals <- c(0.90, 0.95, 0.99)

## Creating function for easy usage(same weight tails)
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
      chi_low <- qchisq(alpha/2, n)
      chi_upp <- qchisq(1 - alpha/2, n)
      
      ## Calculating limits
      limit_inf <- chi_low 
      limit_upp <- chi_upp 
      
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


## B.2
## Creating function for easy usage(same weight tails)
chi_table_function_MINw <- function(n_vector, conf_int_vector){
  
  ## Defining list to store outputs
  chi_table <- list()
  
  ## Iterating over each sigma value 
  for (n in n_vector) {
    
    ## Iterating over each confidence interval value we have
    for (ci in conf_int_vector){
      
      ## Defining auxiliars vectors
      l <- numeric(0)
      qiaux <- numeric(0)
      qsaux <- numeric(0)
      
      ## Defining alpha
      alpha <- 1 - ci
      
      ## Defining a limit to iterate
      limit <- qchisq(alpha/2, n)
      
      ## Defining my random numbers
      numbers <- runif(100, min=0, max=limit)
      
      ## Iterating
      for (num in numbers){
        
        ## Defining auxiliar variable
        a <- pchisq(num, n)
        
        ## Defining qsuperior
        qf <- qchisq(1 + a - alpha, n)
        
        ## Calculating limits
        limit_inf <- num 
        limit_upp <- qf
        
        ## Calculating w value (Difference between upper limit and lower limit)
        w <- limit_upp - limit_inf
        
        ## Storing w data
        l <- c(l, w)
        
        ## Storing auxiliar data
        qiaux <- c(qiaux, num)
        qsaux <- c(qsaux, qf)
        
      }
      
      ## Getting the min amplitude interval
      min_amplitude <- min(l)
      
      ## Getting index of the min amplitude interval
      min_index <- which.min(l)
      
      ## Getting the limits of the interval
      limit_inf_f <- qiaux[min_index]
      limit_upp_f <- qsaux[min_index]
      
      ## Storing on the table
      chi_table[[length(chi_table) +1]] <- list(Degrees_of_freedom = n, CI = ci, qi = limit_inf_f, qs = limit_upp_f, w = min_amplitude)
      
    }
    
  }
  
  return(chi_table)
  
}

# Using our function 
chi_ta2 <- chi_table_function_MINw(degreesF_vector, confidence_intervals)

# Visualizing results
print(chi_ta2)