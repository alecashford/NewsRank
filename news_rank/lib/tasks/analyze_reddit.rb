require 'statsample'

# Independent Variable
x_data = [Math.exp(1), Math.exp(2), Math.exp(3), Math.exp(4), Math.exp(5)]

# Dependent Variable
y_data = [3, 5, 7, 9, 11]

# Logarithmic Transformation of X data
# Math.log in Ruby has the base of Euler's number 'e' ~= '2.71828',
# instead of the base '10'. Just a note.
log_x_data = x_data.map { |x| Math.log(x) }

# Linear Regression using the Logarithmic Transformation
x_vector = log_x_data.to_vector(:scale)
y_vector = y_data.to_vector(:scale)
ds = {'x'=>x_vector,'y'=>y_vector}.to_dataset
mlr = Statsample::Regression.multiple(ds,'y')

# Prints a statistical summary of the regression
print mlr.summary

# Lists the value of the y-intercept
p mlr.constant

# Lists the coefficients of each casual variable. In this case, we have only one--'x'.
p mlr.coeffs

# The regression output produces the line y = 1 + 2*x, but
# considering that we transformed x earlier, it really produces
# y = 1 + 2*ln(x).

# Bonus: The command below lists the methods contained in the instance variable, so that
# you can get the R^2, SSE, coefficients, and t-values. I'll leave it commented out for now.
# p mlr.methods

Statsample::Analysis.run_batch