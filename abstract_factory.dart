abstract class Drinkable {
  void pour();
}

class Beer extends Drinkable {
  void pour() {
    print("Pouring a delicious beer!");
  }
}

class Coffee extends Drinkable {
  void pour() {
    print("Pouring a refreshing coffee!");
  }
}

abstract class DrinkFactory {
  Drinkable createDrink();
}

class Pub implements DrinkFactory {
  Drinkable createDrink() {
    return Beer();
  }
}

class CoffeeShop implements DrinkFactory {
  Drinkable createDrink() {
    return Coffee();
  }
}

void main() {
  String mood = "done";
  late DrinkFactory destination;

  switch(mood) {
    case "sleepy": destination = CoffeeShop(); break;
    case "done": destination = Pub(); break;
    default: print("I only have two moods...");
  }

  Drinkable myDrink = destination.createDrink();
  myDrink.pour();

}