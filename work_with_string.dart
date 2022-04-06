// 3 задание
// Реализуйте метод, который принимает строку слов, разделённых пробелами.
// Задача — найти в данной строке числа и вернуть коллекцию num этих чисел.
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

// 4 задание
// Есть коллекция слов. Реализуйте метод, возвращающий Map.
// Данный Map должен соотносить слово
// и количество его вхождений в данную коллекцию.
class WordsMap {
  static Map<String, int> getMapFromCollection(Iterable collection) {
    final words = new Map<String, int>();

    for (final word in collection) {
      words.update(word, (value) => value + 1, ifAbsent: () => 1);
    }
    return words;
  }
}

// 5 задание
// Есть коллекция строк вида ‘one, two, three, cat, dog’ или любого другого.
// Реализуйте метод, возвращающий цифры без повторений,
// которые встречаются в данной строке.
// Однако цифры встречаются в виде английских слов от zero до nine.
// Например, в результате строки ‘one, two, zero, zero’
// мы получим следующий результат: [1, 2, 0].
// Если в строке есть слова, не являющиеся цифрами от 0 до 9, пропускайте их.
class WordToNumberConverter {
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
  final number = ListMapFromString.getNumbesFromString(
      'Олегу было 40 лет и он делал ошибк1');

  print(
      'В строке  "Олегу было 40 лет и он делал ошибк1" найдены числа: $number');

  final words = ['Анатолий', 'Васерман', 'Анатолий', 'Волга'];
  final maps = WordsMap.getMapFromCollection(words);

  print('Из коллекции $words получилась такая map"a: $maps');

  final numberAsWords = 'one, two, three, cat, dog';
  final numberAsNumber = WordToNumberConverter.getSetFromString(numberAsWords);

  print(
      'Из коллекции $numberAsWords получилась такая коллекция"a:$numberAsNumber');
}
