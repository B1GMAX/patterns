void main() {
  Application myApp1 = Application("Internet Browser");
  Application myApp2 = Application("Internet Browser 2");
myApp1.about();
}

class Application {
  String name;
  static Application app = Application.name("");

  Application.name(this.name);

  factory Application(String name) {
    if (app.name == "") {
      app = Application.name(name);
      print("Приложение $name запущено");
    } else {
      print("В приложении ${app.name} открыта новая вкладка");
    }
    return app;
  }
  void about(){
    print("Приложение $name");
  }
}
