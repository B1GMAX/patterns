class RainbowIterator implements Iterator {
  List<String>_colors = ["Red", "Orange", "Yellow", "Green", "Blue", "Indigo", "Violet"];
  int _index = 0;
  String get current => _colors[_index++];
  bool moveNext() => _index < _colors.length;
}

void main() {
  RainbowIterator rainbowColors = RainbowIterator();
  while(rainbowColors.moveNext()) {
    print(rainbowColors.current);
  }
}