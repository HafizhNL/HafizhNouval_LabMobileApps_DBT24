import "dart:io";
import "dart:math";

void main() {
  int angka = Random().nextInt(100) + 1;
  int percobaan = 0;

  print("=== Tebak Angka 1-100 ===\n");

  while (true) {
    print("Tebakan Anda: ");
    String? input = stdin.readLineSync();
    int tebak = int.parse(input!);

    percobaan++;

    if (tebak == angka) {
      print("\nJawaban benar = $angka");
      print("Selamat, berhasil menebak setelah $percobaan percobaan");
      break;
    } else if (tebak < angka) {
      print("Terlalu kecil!\n");
    } else {
      print("Terlalu besar!\n");
    }
  }
}