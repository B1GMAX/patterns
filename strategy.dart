abstract class CoffeeStrategy {
  String announce(String roast);
}

class AmericanoStrategy implements CoffeeStrategy {
  String announce(String roast) => "an Americano with $roast beans";
}

class DripStrategy implements CoffeeStrategy {
  String announce(String roast) => "a drip coffee with $roast beans";
}

class MochaFrappuccinoStrategy implements CoffeeStrategy {
  String announce(String roast) => "a delicious mocha frappuccion with $roast beans";
}

class CoffeeDrinker {
  CoffeeStrategy preferredDrink;
  String name;
  CoffeeDrinker(this.name, this.preferredDrink);
}

void main() {
  AmericanoStrategy americano = AmericanoStrategy();
  DripStrategy drip = DripStrategy();
  MochaFrappuccinoStrategy mocha = MochaFrappuccinoStrategy();

  CoffeeDrinker me = CoffeeDrinker("Tyler", drip);
  CoffeeDrinker europeanBuddy = CoffeeDrinker("Pieter", americano);
  CoffeeDrinker myDaughter = CoffeeDrinker("Joanie", mocha);

  final String roastOfTheDay = "Italian";

  for (CoffeeDrinker person in [me, europeanBuddy, myDaughter]) {
    print("Hey ${person.name}, whatcha drinkin' over there?");
    print("I'm enjoying ${person.preferredDrink.announce(roastOfTheDay)}!\r\n");
  }

}