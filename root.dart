// Задание 7
// Реализуйте метод, который вычисляет корень любой заданной степени из числа.

double f_prime(double x, double p) {
  return p * power(x, p - 1);
}

double f(double x, double p, double num) {
  return power(x, p) - num;
}

double power(double x, double y) {
  if (y == 0) return 1;
  if (y % 2 == 0)
    return power(x, y / 2) * power(x, y / 2);
  else
    return x * power(x, y / 2) * power(x, y / 2);
}

extension on num {
  double root(double num, double p) {
    double left = -num;
    double right = num;

    double x;
    while (true) {
      x = (left + right) / 2.0;
      double value = f(x, p, num);
      double prime = f_prime(x, p);
      if (value * prime <= 0)
        left = x;
      else
        right = x;
      if (value < 0.000001 && value >= 0) {
        return x;
      }
    }
  }
}

void main() {
  print(5.root(5, 10));
}
