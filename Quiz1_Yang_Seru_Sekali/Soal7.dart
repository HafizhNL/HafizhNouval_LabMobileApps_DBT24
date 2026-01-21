void main() {
  List<int> a = [1, 3, 5, 7];
  List<int> b = [2, 4, 6, 8];
  List<int> merged = [...a, ...b];
  merged.sort();
  print('Gabung: $merged');
  print('Output: ${merged.last}');
}