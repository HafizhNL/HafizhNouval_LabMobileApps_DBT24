import "dart:io";

class Ujian {
  int totalNilai = 0;
  int totalMahasiswa = 0;

  void tambahNilai(int nilai) {
    totalNilai += nilai;
    totalMahasiswa += 1;
  }

  num hitungRataRata() {
    return totalNilai / totalMahasiswa;
  }
}

void main() {
  Ujian ujian = Ujian();
  
  for (int i = 1; i <= 3; i++) {
    stdout.write("Input nama student: ");
    String? nama = stdin.readLineSync();
    
    stdout.write("Input nilai $nama: ");
    String? inputNilai = stdin.readLineSync();
    int nilai = int.parse(inputNilai!);
    
    ujian.tambahNilai(nilai);
  }
  
  print("Rata-rata nilai adalah ${ujian.hitungRataRata()}");
}