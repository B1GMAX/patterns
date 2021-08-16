abstract class Beverage {
  double cost;
  List<String> ingredients;
}

class Ingredient {
  double cost;
  String name;

  Ingredient(this.name, this.cost);

}

class Coffee implements Beverage {
  double cost = 5;
  List<String> ingredients = List.from(["coffee", "milk", "sugar"]);
}

class StarbucksCoffeeDecorator implements Beverage {
  Beverage coffee = Coffee();
  double cost=8;
  List<String> ingredients = Coffee().ingredients;
}

void main() {
  Coffee coffee = Coffee();
  StarbucksCoffeeDecorator starbucksCoffee = StarbucksCoffeeDecorator();

  print("Coffee contains ${coffee.ingredients.join(",")}. It costs \$${coffee.cost}");
  print(
      "Starbucks coffee contains ${starbucksCoffee.ingredients.join(",")}. It costs \$${starbucksCoffee.cost}");
}
