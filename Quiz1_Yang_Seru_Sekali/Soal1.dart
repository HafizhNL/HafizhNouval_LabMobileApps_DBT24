void main() {
  List a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100];
  List result = [];
  for (int i in a) {
      if (i % 2 == 0) {
        result.add(i);
      }
  }
  print(result);
  
}