// Задание 7
// Реализуйте метод, который вычисляет корень любой заданной степени из числа.

extension RootExtention on num {
  num root(num power) {
    if (this < 0) {
      throw ArgumentError(
          'Невозвможно получить степень у отрицательного числа');
    }

    if (this == 1) {
      return 1;
    }

    num root = this;
    while ((this - root.pow(power)).abs() > 0.001) {
      root = 1 / power * ((power - 1) * root + this / root.pow(power - 1));
    }
    return root;
  }

  num pow(num power) {
    num result = 1;
    for (var i = 0; i < power; i++) {
      result *= this;
    }
    return result;
  }
}

void main() {
  print(-256.root(4));
}
