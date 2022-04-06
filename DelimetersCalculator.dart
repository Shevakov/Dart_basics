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

class Point {
  final double x;
  final double y;
  final double z;

  Point(this.x, this.y, this.z);

  factory Point.zero() {
    return Point(0, 0, 0);
  }

  factory Point.vector() {
    return Point(1, 1, 1);
  }

  double distanceTo(Point another) {
    return sqrt(pow((another.x - x), 2) +
        pow((another.y - y), 2) +
        pow((another.z - z), 2));
  }

  double square(Point one, Point two, Point three) {
    double firstSide = one.distanceTo(two);
    double secondSide = two.distanceTo(three);
    double thirdstSide = three.distanceTo(one);
    double halfPerimeter = (firstSide + secondSide + thirdstSide) / 2;

    return sqrt(halfPerimeter *
        (halfPerimeter - firstSide) *
        (halfPerimeter - secondSide) *
        (halfPerimeter - thirdstSide));
  }
}

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

class User {
  String email;

  User(this.email);
}

mixin MailSystem on User {
  String getMailSystem() => email.substring(email.indexOf('@') + 1);
}

class AdminUser extends User with MailSystem {
  AdminUser(String email) : super(email);
}

class GeneralUser extends User {
  GeneralUser(String email) : super(email);
}

class UserManager<T extends User> {
  final users = <User>[];

  void addUser(User user) {
    users.add(user);
  }

  void clearUsers() {
    users.clear();
  }

  void printEmails() {
    for (var user in users) {
      if (user is AdminUser) {
        print(user.getMailSystem());
      } else {
        print(user.email);
      }
    }
  }
}

class MidpointRectangleRule {
  double calculationIntegral(Function func, double a, double b, int nseg) {
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
  final admin = new AdminUser('test@mail.com');
  final mana = new UserManager();
  mana.addUser(admin);
  mana.addUser(new User('123@123.ru'));
  mana.printEmails();
}
