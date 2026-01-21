import "dart:io";
import "dart:math";

void main() {
  List<String> play = ["Rock", "Paper", "Scissors"];
  String computerChoice = play[Random().nextInt(3)];

  print("Pilihan Anda (Rock/Paper/Scissors): ");
  String? userChoice = stdin.readLineSync();

  if (userChoice == null || userChoice.isEmpty) {
    print("Input tidak valid!");
    return;
  }

  print("\nPilihan Anda: $userChoice");
  print("Pilihan Komputer: $computerChoice\n");

  if (userChoice == computerChoice) {
    print("SERI!");
  } else if (
    (userChoice == "Rock" && computerChoice == "Scissors") ||
    (userChoice == "Scissors" && computerChoice == "Paper") ||
    (userChoice == "Paper" && computerChoice == "Rock")
  ) {
    print("ANDA MENANG!");
  } else {
    print("ANDA KALAH!");
  }
}