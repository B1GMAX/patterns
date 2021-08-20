void main() {
  final s1 = Singleton();
  final s2 = Singleton();

  print('s1 = ${s1.hashCode}');

  print('s2 = ${s2.hashCode}');
}

class Singleton {
  static final Singleton _singleton = Singleton._privat();

  factory Singleton() {
    return _singleton;
  }

  Singleton._privat() {
    print('Hello');
  }
}
