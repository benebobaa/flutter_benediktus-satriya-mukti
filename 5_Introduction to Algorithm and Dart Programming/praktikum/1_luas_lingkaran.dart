import 'dart:io';

void main(List<String> args) {
  print("Masukkan jari-jari :");
  double? r = double.parse(stdin.readLineSync()!);
  print("luas lingkaran adalah :");
  print(luasLingkaran(r));
}

double luasLingkaran(double r) {
  const phi = 3.14;
  double luas = phi * r * r;
  return luas;
}
