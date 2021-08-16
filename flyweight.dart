import "dart:collection";

class Letter {
  String letter;
  Letter(String l) {
    if (l.length != 1) { throw new Exception("Can only be a single letter"); }
    letter = l;
  }

  @override
  String toString() => letter;
}

class Sentence {
  List<Letter> letters = [];
  void addLetter(Letter letter) => letters.add(letter);

  @override
  String toString() => letters.join("");
}

class LetterFactory {
  Map<String, Letter> letters = {};

  Letter fetchLetter(String l) {
    if (letters.containsKey(l)) { return letters[l]; }
    var letter = Letter(l);
    letters[l] = letter;
    return letter;
  }

  int get lettersCreated => letters.length;
}

class Document {
  LetterFactory letterFactory = LetterFactory();
  int lettersWritten = 0;
  SplayTreeMap<int, Sentence> sentences;

  Document() {
    sentences = new SplayTreeMap<int, Sentence>();
  }



  void write(int sentenceKey, String letterString) {
    if (!sentences.containsKey(sentenceKey)) {
      sentences[sentenceKey] = Sentence();
    }

    var l = letterFactory.fetchLetter(letterString);
    sentences[sentenceKey].addLetter(l);
    lettersWritten++;
  }

  int get lettersCreated => letterFactory.lettersCreated;
}

void main() {
  var doc = Document();

  doc.write(6, "t");
  doc.write(7, "u");
  doc.write(1, "A");
  doc.write(2, "y");
  doc.write(7, "s");



  print("\r\nDocument wrote: ${doc.lettersWritten}.");
  print("Letters created: ${doc.lettersCreated}.");
}