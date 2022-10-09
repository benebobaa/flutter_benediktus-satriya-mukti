class Matematika {
  int hasil() {
    return 0;
  }
}

class KelipatanPersekutuanTerkecil implements Matematika {
  int x = 10;
  int y = 15;

  @override
  int hasil() {
    int kpk = 0;
    for (int i = 0; i < y; i++) {
      kpk += x;
    }
    return kpk;
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  int x = 10;
  int y = 15;

  @override
  int hasil() {
    int mod = x % y;

    while (mod != 0) {
      x = y;
      y = mod;
      mod = x % y;
    }
    return y;
  }
}

void main(List<String> args) {
  var operation = Matematika();
  var kpk = KelipatanPersekutuanTerkecil();
  var fpb = FaktorPersekutuanTerbesar();

  print(operation.hasil());
  print(kpk.hasil());
  print(fpb.hasil());
}
