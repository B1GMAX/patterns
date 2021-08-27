class Fruit {
  final String name;
  final String color;

  Fruit( this.name, this.color );
}

class Fruits {
  List<Fruit> fruits = [];

  Fruits( this.fruits );

  FruitsIterator get iterator {
    return FruitsIterator( this.fruits );
  }
}

class FruitsIterator extends Iterator<String> {
  List<Fruit> fruits = [];
  String _current;
  int index = 0;

  FruitsIterator( this.fruits );

  bool moveNext() {
    if( index == fruits.length ) {
      _current = null;
      return false;
    } else {
      _current = fruits[ index++ ].name;
      return true;
    }
  }

  String get current => _current;
}

void main() {
  Fruits fruits = Fruits([
    Fruit('Banana', 'Yellow'),
    Fruit('Mango', 'Orange'),
    Fruit('Apple', 'Red')
  ]);


  FruitsIterator iterator = fruits.iterator;

  while (iterator.moveNext()) {
    print('Fruit name: ${ iterator.current }');
  }
}