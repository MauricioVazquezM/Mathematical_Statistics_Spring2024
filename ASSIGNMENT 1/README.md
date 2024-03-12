# Assignment 1 Topics

## Stirling approximation

- The Stirling approximation is a formula used to estimate the factorial of a large number, n!. It is especially useful in probability theory, statistics, and various areas of physics and engineering where calculations involve the factorials of large numbers.
  <br>
- The Stirling approximation is commonly expressed as:
  <br>
  **The Stirling approximation**
```math
n! \approx \sqrt{2 \pi n} \left( \frac{n}{e} \right)^n
```
    <br>
- This formula provides an estimate that becomes more accurate as n increases. Although the Stirling approximation does not give the exact value of the factorial, the difference between the value calculated using the Stirling approximation and the actual factorial value decreases in proportion with the increase in n.
  <br>
- Furthermore, there are more precise versions of the Stirling approximation that include additional terms to improve the accuracy of the estimate for smaller values of n, such as:
  <br>
```math
n! \approx \sqrt{2 \pi n} \left( \frac{n}{e} \right)^n \left(1 + \frac{1}{12n} + \frac{1}{288n^2} - \cdots \right)
```