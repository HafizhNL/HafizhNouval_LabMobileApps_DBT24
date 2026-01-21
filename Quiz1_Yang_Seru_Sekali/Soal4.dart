import "dart:io";

void main() {
  print("Masukkan angka:");
  String? input = stdin.readLineSync();
  int angka = int.parse(input!);
  
  bool prima = true;
  
  if (angka < 2) {
    prima = false;
  } else {
    for (int i = 2; i < angka; i++) {
      if (angka % i == 0) {
        prima = false;
        break;
      }
    }
  }
  
  if (prima) {
    print("$angka adalah bilangan prima");
  } else {
    print("$angka bukan bilangan prima");
  }
}