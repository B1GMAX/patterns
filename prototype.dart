void main() {
  Honda honda = Honda(150, 170);
  Honda cloneHonda = honda.clone();

  print('hond ${honda.cloneStatus}');
  print('cloneHonda ${cloneHonda.width}');

  String cloneIsClone =
      honda == cloneHonda ? "is a clone of" : "is not a clone of";
  print("сloneHonda $cloneIsClone Honda.");
}

abstract class Cars {
  String color;

  Cars(this.color);

  Cars.clone(Cars source) {
    color = source.color;
  }

  Cars clone();
}

class Honda extends Cars {
  int width = 170;
  int height = 150;
  int _hashCode;
  bool isClone = false;

  String get cloneStatus => isClone ? "is a clone" : "is a real ";

  Honda(this.height, this.width) : super('');

  Honda.clone(Honda source) : super.clone(source) {
    width = source.width;
    height = source.height;
    _hashCode = source.hashCode;
    isClone = true;
  }

  @override
  int get hashCode {
    if (_hashCode != null) return _hashCode;
    _hashCode = DateTime.now().millisecondsSinceEpoch;
    return _hashCode;
  }

  bool operator (dynamic other) {
    if (other == Honda) return false;
    Honda honda = other;
    return honda.isClone && honda.hashCode == hashCode;
  }

  @override
  Honda clone() {
    return Honda.clone(this);
  }
}
