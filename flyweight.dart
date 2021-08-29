import 'dart:collection';

abstract class EnglishCharacter {
  String symbol;

  int width;

  int height;

  void printCharacter();
}

class CharacterA extends EnglishCharacter {
  CharacterA() {
    symbol = 'A';
    width = 10;
    height = 20;
  }

  @override
  void printCharacter() {
    print("Symbol = " +
        '$symbol' +
        " Width = " +
        '$width' +
        " Height = " +
        '$height');
  }
}

class CharacterB extends EnglishCharacter {
  CharacterB() {
    symbol = 'B';
    width = 20;
    height = 30;
  }

  @override
  void printCharacter() {
    print("Symbol = " +
        '$symbol' +
        " Width = " +
        '$width' +
        " Height = " +
        '$height');
  }
}

class CharacterC extends EnglishCharacter {
  CharacterC() {
    symbol = 'C';
    width = 40;
    height = 50;
  }

  @override
  void printCharacter() {
    print("Symbol = " +
        '$symbol' +
        " Width = " +
        '$width' +
        " Height = " +
        '$height');
  }
}

class FlyweightFactory {
  HashMap<int, EnglishCharacter> characters = HashMap();

  EnglishCharacter getCharacter(int characterCode) {
    EnglishCharacter character = characters[characterCode];
    if (character == null) {
      switch (characterCode) {
        case 1:
          {
            character = CharacterA();
            break;
          }
        case 2:
          {
            character = CharacterB();
            break;
          }
        case 3:
          {
            character = CharacterC();
            break;
          }
      }
      characters[characterCode] = character;
    }
    return character;
  }
}

void main() {
  FlyweightFactory factory = FlyweightFactory();

  List<int> characterCodes = [1, 2, 3];
  for (int nextCode in characterCodes) {
    EnglishCharacter character = factory.getCharacter(nextCode);
    character.printCharacter();
  }
  List<int> characterCodes2 = [2, 1, 3];
  for (int nextCode in characterCodes2) {
    EnglishCharacter character = factory.getCharacter(nextCode);
    character.printCharacter();
  }
}
