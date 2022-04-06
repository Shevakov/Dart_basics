// Задание 9
// Реализуйте метод

class MidpointRectangleRule {
  static double calculationIntegral(Function func, double a, double b, int nseg) {
    double dx = 1.0 * (b - a) / nseg;
    double sum = 0.0;
    final list = new List<int>.generate(nseg, (i) => i + 1);

    double xstart = a + 0.5 * dx;

    for (var item in list) {
      sum += func(xstart + item * dx);
    }

    return sum * dx;
  }
}

void main() {
  print(MidpointRectangleRule.calculationIntegral(fun, 10));
}
