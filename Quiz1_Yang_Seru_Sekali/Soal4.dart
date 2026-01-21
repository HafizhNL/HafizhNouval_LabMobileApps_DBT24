import "dart:io";
// import "dart:math";

void main() {
  print("masukan input prima");
  int? input = stdin.readByteSync();
  if (input % 2 == 1) {
    print("True");
  } else {
    print("False");
  }

}