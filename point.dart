import 'dart:math';

// Задание 6
// Реализуйте класс Point, который описывает точку в трёхмерном пространстве.
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

void main() {
  double dist = Point.vector().distanceTo(Point.zero());
  double square = Point.zero()
      .square(new Point(0, 0, 0), new Point(0, 4, 4), new Point(3, 3, 3));
  print('Расстояние между точками: $dist');
  print('Площадь треугольника: $square');
}
