import "dart:io";
import "dart:math";

void main () {
  // stdout.write(object)
  // String input? = stdin.readLineSync();
  List play = ["Paper", "Rock", "Scissors"];

  final random = Random();
  int ranNumber = random.nextInt(2);

  String answer = play[ranNumber];

  String? input = stdin.readLineSync();
  print(input);
  print(answer);

  if (input > play) {
    
  }
  

}
