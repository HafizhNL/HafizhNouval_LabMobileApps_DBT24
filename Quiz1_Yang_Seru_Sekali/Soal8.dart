import 'dart:io';

void main() {
  print("Masukkan angka:");
  String? input = stdin.readLineSync();
  int angka = int.parse(input!);
  
  int jumlah = 0;
  
  for (int i = 1; i < angka; i++) {
    if (angka % i == 0) {
      jumlah += i;
    }
  }
  
  if (jumlah == angka) {
    print("True");
  } else {
    print("False");
  }
}