abstract class Room {
  void connect(Room room);
}

class MagicRoom extends Room {
  void connect(Room room) {}
}

class OrdinaryRoom extends Room {
  void connect(Room room) {}
}

abstract class MazeGame {
  final List<Room> rooms = List<Room>();

  MazeGame() {
    Room room1 = makeRoom();
    Room room2 = makeRoom();
    room1.connect(room2);
    rooms.add(room1);
    rooms.add(room2);
  }

  makeRoom();
}

class MagicMazeGame extends MazeGame {
  @override
  Room makeRoom() {
    return MagicRoom();
  }
}

class OrdinaryMazeGame extends MazeGame {
  @override
  Room makeRoom() {
    return OrdinaryRoom();
  }
}
