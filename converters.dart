import 'dart:math';

// 1 Задание
// Реализуйте методы вычисления НОД и НОК целых чисел.
// Реализуйте метод, который разбивает число на простые множители
// и возвращает их.

class DelimetersCalculator {
  static int gcd(int a, int b) {
    int aa = a;
    int bb = b;
    int temp;

    if (a < b) {
      aa = b;
      bb = a;
    }

    while (bb != 0) {
      aa %= bb;
      temp = aa;
      aa = bb;
      bb = temp;
    }

    return aa;
  }

  static int lcm(int a, int b) {
    return a ~/ gcd(a, b) * b;
  }

  static List<int> findDividers(int x) {
    final dividers = <int>[];

    for (int i = 1; i <= sqrt(x); i++) {
      if (x % i == 0) {
        dividers.add(i);

        if (i * i != x) {
          dividers.add(x ~/ i);
        }
      }
    }

    return dividers;
  }
}

// 2 Задание
// Реализуйте методы для преобразования целых чисел
// из десятичной системы в двоичную и обратно.
class NumberConverter {
  static int binaryToDec(int binary) {
    int decimal = 0;

    int base = 1;

    int temp = binary;
    while (temp > 0) {
      int lastDigit = temp % 10;
      temp = temp ~/ 10;

      decimal += lastDigit * base;

      base *= 2;
    }

    return decimal;
  }

  static int decToBinary(int decimal) {
    final binary = <int>[];

    while (decimal > 0) {
      binary.add(decimal % 2);
      decimal = decimal ~/ 2;
    }
    return int.parse(binary.reversed.join());
  }
}

void main() {
  int gcd = DelimetersCalculator.gcd(5, 10);
  int lcm = DelimetersCalculator.lcm(5, 10);

  print('НОД 5 и 10: $gcd');
  print('НОК 5 и 10: $lcm');

  int binary = NumberConverter.binaryToDec(111);
  int dec = NumberConverter.decToBinary(binary);
  print('111 в десятичной системе: $binary');
  print('$dec в двоичной системе: $dec');
}
