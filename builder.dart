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

  PizzaBuilder builder = PizzaBuilder('bbq')..setToppings(['cheese', 'tomato', 'chicken']);
  builder.diameter=100;
  Pizza pizza=builder.build();
  builder.diameter=200;
  builder.toppings=['sausage', 'tomato', 'mushrooms'];
  Pizza pizza2=builder.build();



  print('Woohoo!$pizza');
  print('Woohoo!$pizza2');

}
