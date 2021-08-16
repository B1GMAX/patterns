class Pizza {
  final String sauce;
  final List<String> toppings;
  final int diameter;

  Pizza._builder(PizzaBuilder builder)
      : sauce = builder.sauce,
        toppings = builder.toppings,
        diameter = builder.diameter;

  @override
  String toString() {
    return 'A delicous $diameter diameter pizza with $sauce sauce and $toppings';
  }
}

class PizzaBuilder {
  final String sauce;

  PizzaBuilder(this.sauce);

  List<String> toppings;
  int diameter;

  void setToppings(List<String> toppings) {
    this.toppings = toppings;
    toppings.add('cheese');
  }

  Pizza build() {
    return Pizza._builder(this);
  }
}

void main() {
  print('PIZZA BBQ');

  PizzaBuilder pizzaBuilder = PizzaBuilder('bbq');
  pizzaBuilder.diameter = 100;
  pizzaBuilder.toppings = ['cheese', 'tomato', 'chicken'];

  Pizza plainPizza = Pizza._builder(pizzaBuilder);
  print('Woohoo!$plainPizza');
}
