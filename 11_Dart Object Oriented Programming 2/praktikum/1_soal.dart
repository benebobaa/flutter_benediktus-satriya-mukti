class BangunRuang {
  int panjang = 5;
  int lebar = 6;
  int tinggi = 8;

  int volume() {
    var volume = panjang * lebar * tinggi;
    return volume;
  }
}

class Kubus extends BangunRuang {
  int sisi = 4;

  @override
  int volume() {
    var volumeKubus = sisi * sisi * sisi;
    return volumeKubus;
  }
}

class Balok extends BangunRuang {
  @override
  int volume() {
    var volumeBalok = panjang * lebar * tinggi;
    return volumeBalok;
  }
}

void main(List<String> args) {
  var bangun = BangunRuang();
  var kubus = Kubus();
  var balok = Balok();

  print(bangun.volume());
  print(kubus.volume());
  print(balok.volume());
}
