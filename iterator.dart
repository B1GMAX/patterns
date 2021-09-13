abstract class Iterator {
  bool hasNext();

  Object next();
}

abstract class Container {
  Iterator getIterator();
}

class NameRepository implements Container {
  @override
  Iterator getIterator() {
    return NameIterator(names);
  }

  List<String> names = ["Robert", "John", "Julie", "Lora"];
}

class NameIterator implements Iterator {
  int index = 0;
  final List<String> names;

  NameIterator(this.names);

  @override
  bool hasNext() {
    if (index < names.length) {
      return true;
    }

    return false;
  }

  @override
  Object next() {
    if (this.hasNext()) {
      return names[index++];
    }
    return null;
  }
}

void main(List<String> args) {
  NameRepository namesRepository = NameRepository();
  for (Iterator iter = namesRepository.getIterator(); iter.hasNext();) {
    String name = iter.next();
    print("Name :$name ");
  }
}
