class Car {
  String method() {
    print('The/method car is started');
   return 'The best car';
  }
}

abstract class Target {
  String call();
}

class RailAdapter extends Target {
  String call() {
    Car car = Car();
    print('RailAdapter/call is started');

    return car.method();
  }
}

void main() {
  RailAdapter railAdapter = RailAdapter();
  String result = railAdapter.call();

  print(result);
}