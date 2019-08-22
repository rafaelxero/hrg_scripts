function y = LPFilter(x, x_old, y_old, a)

p = 1 / (1 - 2 * a^2) - sqrt(1 / (1 - 2 * a^2)^2 - 1);
b0 = (1 - p) / 2;

y = b0 * x + b0 * x_old + p * y_old;