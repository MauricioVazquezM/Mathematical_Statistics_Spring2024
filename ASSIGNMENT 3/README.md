# Assignment 3 Topics

## Uniformly Minimum Variance Unbiased Estimator (UMVUE)

UMVUE stands for Uniformly Minimum Variance Unbiased Estimator in statistics. It's a type of estimator that possesses the lowest variance among all unbiased estimators for all possible values of the parameter being estimated. Here's a breakdown of the concept:
<br>
- **Unbiasedness:** An estimator is unbiased if its expected value equals the parameter it estimates, regardless of the parameter's actual value. This means that on average, the estimator accurately reflects the true parameter value across different samples.

- **Minimum Variance:** Among all unbiased estimators, a UMVUE has the smallest variance. This means it has the least spread around the true parameter value, making it more reliable and precise.

- **Uniformity:** The property of having minimum variance holds uniformly over all values of the parameter. This consistency across different parameter values is a key strength of UMVUE.

UMVUEs are particularly valued because they offer a balance between accuracy (due to being unbiased) and precision (due to having minimal variance). Finding a UMVUE often involves techniques such as the Rao-Blackwell theorem, which can improve an unbiased estimator's efficiency, and the Lehmann-Scheffé theorem, which is used to identify a UMVUE when a complete sufficient statistic exists.

<br>
These estimators are widely used in various statistical applications, particularly in hypothesis testing, confidence interval estimation, and model parameter estimation, where optimal accuracy and precision are crucial.


## Confidence intervals

Confidence intervals (CIs) are a key statistical tool used to estimate the range within which a population parameter (like a mean or proportion) is expected to fall with a certain level of confidence. Here's a succinct breakdown of their main elements:
<br>

**1. Definition:** A confidence interval provides a range of values, derived from sample data, which is likely to contain the value of an unknown population parameter. The interval has an associated confidence level that quantifies the degree of certainty (or confidence) in the estimation.

**2. Confidence Level:** Typically expressed as a percentage (commonly 90%, 95%, or 99%), the confidence level reflects the frequency with which the interval would capture the true parameter value if the same data were repeatedly sampled. For example, a 95% confidence level means that if the data were sampled 100 times, approximately 95 of those samples would produce intervals that include the true parameter.

**3. Calculation:** To compute a confidence interval, you need:
  - ***Point Estimate:*** This is the value calculated from the sample data, which best estimates the parameter of interest (e.g., sample mean).
  - ***Margin of Error (MoE):*** This is added and subtracted from the point estimate and is calculated using the standard error (SE) of the estimate and the critical value from the distribution that corresponds to the desired confidence level (often a z-score from the standard normal distribution for large samples or a t-score from the t-distribution for smaller samples).
- The formula is generally:

```math
( \text{Point Estimate} \pm (\text{Critical Value} \times \text{Standard Error}))
```

***4. Interpretation:*** If a 95% CI for the mean is (10, 20), it suggests that there is a 95% chance that the true population mean falls between 10 and 20. It's important to note that the interval either contains the true mean or it doesn't; the confidence level pertains to the method's long-run accuracy.

***5. Usage:*** Confidence intervals are used extensively across scientific research, market research, policy analysis, and other fields that require estimation of population parameters with a quantified uncertainty. They provide more information than single-point estimates by illustrating the range of plausible values for the parameter and the precision of the estimate.

<br>
Overall, confidence intervals are a fundamental concept in statistics for making inferences about population parameters from sample data, emphasizing both the estimate's precision and reliability.
