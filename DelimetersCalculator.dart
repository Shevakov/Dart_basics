import 'dart:io';
import 'dart:math';

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

class ListMapFromString {
  static List<num> getNumbesFromString(String words) {
    final numbers = <num>[];

    for (var word in words.split(' ')) {
      num? number = int.tryParse(word.replaceAll(RegExp(r'[^0-9]'), ''));
      if (number is num) {
        numbers.add(number);
      }
    }
    return numbers;
  }
}

class WordsMap {
  static Map<String, int> getMapFromCollection(Iterable collection) {
    final words = new Map<String, int>();

    for (final word in collection) {
      words.update(word, (value) => value + 1, ifAbsent: () => 1);
    }
    return words;
  }
}

class WortToNumberConverter {
  static Map<String, int> _dictionary = {
    'zero': 0,
    'one': 1,
    'two': 2,
    'three': 3,
    'four': 4,
    'five': 5,
    'six': 6,
    'seven': 7,
    'eight': 8,
    'nine': 9,
  };

  static List<int> getSetFromString(String words) {
    final digists = new Set<int>();

    for (var word in words.split(', ')) {
      int? number = _dictionary[word];

      if (number != null) {
        digists.add(number);
      }
    }
    return digists.toList();
  }
}

void main() {
  print(WortToNumberConverter.getSetFromString('one, two, three, cat, dog'));
}
