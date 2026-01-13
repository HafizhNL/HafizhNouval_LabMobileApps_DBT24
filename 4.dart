void main() {
  String kalimat = "aku cinta padamu";
  reverseSentence(kalimat);
}

void reverseSentence(String sentence) {
  List<String> words = sentence.split(" ");
  List<String> reversedWords = [];

  for (var i = words.length - 1; i >= 0; i--) {
    reversedWords.add(words[i]);
  }

  String reversedSentence = reversedWords.join(" ");
  print(reversedSentence);
}