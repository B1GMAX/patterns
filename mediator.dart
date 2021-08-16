abstract class Stateful {
  String _state;
  String get state => _state;
  void set state(String newState) => _state = newState;
}

class Mediator {
  List<Stateful> _parties;
  Mediator(this._parties);
  void update(String state) {
    for (Stateful party in _parties) {
      party.state = state;
    }
  }
}

class Attendee extends Stateful {
  String name;
  Attendee(this.name);
}

void main() {
  Attendee curly = Attendee("Curly");
  Attendee larry = Attendee("Larry");
  Attendee moe = Attendee("I prefer not to disclose my name");
  List<Attendee> mixer = List<Attendee>.from([curly, larry, moe]);
  Mediator publicAnnouncementSystem = Mediator(mixer);

  publicAnnouncementSystem.update("Do NOT eat the shrip tacos!");

  for (Attendee person in mixer) {
    print("${person.name} heard \"${person.state}\".");
  }

}