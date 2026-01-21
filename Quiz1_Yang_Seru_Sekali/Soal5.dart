import "dart:io";

class Ujian {
  int TotalMahasiswa = 0;
  int TotalNilai = 0;

  void tambahNilai(int nilai) {
    TotalNilai += nilai;
    TotalMahasiswa += 1;
  }

  num hitungAverage() {
    return TotalNilai/TotalMahasiswa;
  }
}

void main() {
  Ujian avgNilai = Ujian();
  
  

}