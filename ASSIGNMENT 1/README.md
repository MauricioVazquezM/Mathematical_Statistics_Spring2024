# Assignment 1 Topics

## Stirling approximation

- The Stirling approximation is a formula used to estimate the factorial of a large number, n!. It is especially useful in probability theory, statistics, and various areas of physics and engineering where calculations involve the factorials of large numbers.
  <br>
- The Stirling approximation is commonly expressed as:

```math
n! \approx \sqrt{2 \pi n} \left( \frac{n}{e} \right)^n
```
- This formula provides an estimate that becomes more accurate as n increases. Although the Stirling approximation does not give the exact value of the factorial, the difference between the value calculated using the Stirling approximation and the actual factorial value decreases in proportion with the increase in n.
- Furthermore, there are more precise versions of the Stirling approximation that include additional terms to improve the accuracy of the estimate for smaller values of n, such as:

```math
n! \approx \sqrt{2 \pi n} \left( \frac{n}{e} \right)^n \left(1 + \frac{1}{12n} + \frac{1}{288n^2} - \cdots \right)
```
- These additional terms make the formula more complex but significantly improve precision for smaller values of n. The Stirling approximation is a classic example of how mathematical methods can simplify and facilitate the calculation of functions that would otherwise be very difficult to manage, especially for large numbers.

## Central Limit Theorem

Let $\{X_1, X_2, ..., X_n\}$ be a sequence of ${n}$ independent and identically distributed (i.i.d.) random variables with mean ${\mu\}$ and variance ${\sigma^2 > 0\}$. Then, as ${n}$ approaches infinity, the distribution of the standardized sum:

${Z_n = \frac{\sum_{i=1}^{n} X_i - n\mu}{\sigma\sqrt{n}}}$

converges in distribution to a standard normal distribution ${N(0, 1)}$, that is...

${\ Z_n \xrightarrow{d} N(0, 1) \, as \, n \to \infty. }$

<br>
- The Central Limit Theorem (CLT) is a fundamental principle in mathematical statistics that explains the behavior of the sum or average of a large number of independent, identically distributed random variables. Regardless of the original distribution of these variables, as the sample size grows, the distribution of their sum or average tends towards a normal (Gaussian) distribution.

- This theorem holds under fairly general conditions, making it incredibly powerful and widely applicable in the field of statistics and beyond. The CLT underpins many statistical methods and hypotheses testing techniques, providing a justification for the use of the normal distribution in estimating probabilities and setting confidence intervals, especially for large samples.

- The significance of the CLT lies in its ability to predict the distribution of aggregated random variables, offering a bridge between probability theory and practical data analysis. It ensures that, with a sufficiently large sample size, we can make reliable inferences about population parameters using the normal distribution, even when the population itself does not follow this distribution.

## Simulation

- In mathematical statistics, simulation plays a pivotal role in illustrating and understanding the Central Limit Theorem (CLT). The CLT states that, under certain conditions, the distribution of the sum (or average) of a large number of independent, identically distributed random variables will approximate a normal distribution, regardless of the original distribution of the variables. This theorem is foundational because it justifies the widespread use of normal distribution in statistical inference and hypothesis testing.

- Simulation in this context involves generating a large number of random samples from a specified distribution (which can be anything, not necessarily normal) and then calculating the sum or average of these samples. By repeating this process many times, one can observe that the distribution of these sums or averages tends to a normal distribution as the sample size increases. This empirical process provides a powerful visual and numerical demonstration of the CLT in action.

- Such simulations are invaluable educational tools, as they allow students and practitioners to see the convergence to normality in various settings, enhancing their intuition about the behavior of large samples. Additionally, simulation studies can help in assessing the robustness of statistical methods under conditions that deviate from the theoretical assumptions, offering insights into the practical applications of the CLT in real-world data analysis.