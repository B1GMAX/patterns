abstract class Observable {
  List<Observer> _observers=[];

  void registerObserver(Observer observer) {
    _observers.add(observer);
  }

  void notifyObservers(String notification) {
    for (Observer observer in _observers) {
      observer.notify(notification);
    }
  }
}

class Observer {
  String name;

  Observer(this.name);

  void notify(String notification) {
    print("Hey $name, ${notification}!");
  }
}

class CoffeeMaker extends Observable {

  void brew() {
    print("Brewing the coffee...");
    notifyObservers("coffee's done");
  }
}

void main() {
  CoffeeMaker mrCoffee = CoffeeMaker();
  Observer me = Observer("Tyler");
  Observer myWife = Observer("Kate");
  mrCoffee.registerObserver(me);
  mrCoffee.registerObserver(myWife);
  mrCoffee.brew();
}