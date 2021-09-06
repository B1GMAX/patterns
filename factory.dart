abstract class Room {
  void connect(Room room);
}

class MagicRoom extends Room {
  void connect(Room room) {
    print('Magic rooms connected');
  }
}

class OrdinaryRoom extends Room {
  void connect(Room room) {
    print('Ordinary rooms connected');
  }
}

abstract class MazeGame {
  final List<Room> rooms = [];

  MazeGame() {
    print('MazeGame started');
    Room room1 = makeRoom();
    Room room2 = makeRoom();
    room1.connect(room2);
    rooms.add(room1);
    rooms.add(room2);
    print('Connected rooms added to the game');
  }

  makeRoom();
}

class MagicMazeGame extends MazeGame {
  @override
  Room makeRoom() {
    print('Magic room created');
    return MagicRoom();
  }
}

class OrdinaryMazeGame extends MazeGame {
  @override
  Room makeRoom() {
    print('Ordinary room created');
    return OrdinaryRoom();
  }
}

void main() {
  MazeGame ordinaryGame =  OrdinaryMazeGame();
  MazeGame magicGame = MagicMazeGame();
  print(ordinaryGame);
}