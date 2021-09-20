abstract class Receiver {
  List<String> get actions;
}

abstract class Command {
  Receiver receiver;
  String name='';

  Command(this.receiver);

  @override
  String toString() => this.name;

  void execute();
}

class Invoker {
  void execute(Command cmd) {
    cmd.execute();
  }
}

class TurnOffCommand extends Command {
  String name = "Turn off";

  TurnOffCommand(Light light) : super(light);

  void execute() {
    (receiver as Light).turnOff();
  }
}

class TurnOnCommand extends Command {
  String name = "Turn on";

  TurnOnCommand(Light light) : super(light);

  void execute() {
    (receiver as Light).turnOn();
  }
}

class Light implements Receiver {
  void turnOff() => print("Light off!");

  void turnOn() => print("Light on!");

  List<String> get actions => List.from(["off", "on"]);
}

class LightSwitch {
  Invoker _switch = Invoker();
  Light light;

  LightSwitch(this.light);

  void perform(String action) {
    if (!light.actions.contains(action)) {
      return print("Wait, wut?");
    }
    switch (action) {
      case "on":
        return _switch.execute(TurnOnCommand(light));
      case "off":
        return _switch.execute(TurnOffCommand(light));
    }
  }
}

void main() {
  Light myFavoriteLamp = Light();
  LightSwitch iotLightSwitch = LightSwitch(myFavoriteLamp);

  iotLightSwitch.perform("on");
  iotLightSwitch.perform("off");
  iotLightSwitch.perform("blink");
  iotLightSwitch.perform("on");
}
