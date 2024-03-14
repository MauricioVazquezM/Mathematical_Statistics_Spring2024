# Assignment 2 Topics

## Estimation Theory and Efficiency

In mathematical statistics, parameter estimation is the process of using sample data to estimate the parameters of a distribution. Several methods are employed for this purpose, each with its advantages and contexts of use. Here's a summary of the most widely used methods:

**1. Maximum Likelihood Estimation (MLE)**
    - ***Principle***: Finds the parameter values that maximize the likelihood function, given the observed data. The likelihood function measures how likely it is to observe the given data for different parameter values of the statistical model.
    - ***Advantages***: Under certain conditions, MLEs have desirable properties such as consistency, efficiency, and asymptotic normality.
    - ****Disadvantages***: Finding the MLE can be computationally intensive for complex models, and there might not always be a closed-form solution.

**2. Method of Moments (MoM)**
    - ***Principle***: Equates sample moments (e.g., sample mean, variance) with theoretical moments of the distribution (in terms of its parameters) and solves these equations to estimate the parameters.
    - ***Advantages***: Simpler computations compared to MLE, often resulting in explicit formulas for the estimators.
    - ***Disadvantages***: The estimators may not be as efficient (in the sense of having minimum variance among unbiased estimators) as those obtained from other methods like MLE.

**3. Bayesian Estimation**
    - ***Principle***: Treats the parameters as random variables and uses Bayes' theorem to update the probability distribution of the parameters based on the observed data. This method requires specifying a prior distribution that reflects the belief about the parameters before seeing the data.
    - ***Advantages***: Incorporates prior knowledge or beliefs about the parameters and provides a probabilistic interpretation of the parameter estimates.
    - ***Disadvantages***: Requires choosing a prior, which can be subjective. Computational complexity can be high, especially for models with multiple parameters.
<br>
Each of these methods has its context where it performs best, depending on the underlying distribution of the data, the presence of outliers, computational resources, and the importance of incorporating prior knowledge. The choice of estimation method can significantly impact the analysis results, making it crucial to understand the properties and assumptions underlying each method.