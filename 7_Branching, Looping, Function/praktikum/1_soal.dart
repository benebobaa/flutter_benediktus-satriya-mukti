import 'dart:io';

void main(List<String> args) {
  print("Masukkan Nilai :");
  int? nilai = int.parse(stdin.readLineSync()!);
  fungsiNilai(nilai);
}

void fungsiNilai(int nilai) {
  if (nilai > 70) {
    print("A");
  } else if (nilai > 40) {
    print("B");
  } else if (nilai > 0) {
    print("C");
  } else {
    print("teks kosong");
  }
}
