
void main(List<String> args) {
  print("nilai faktorial dari 10");
  print(fungsiFaktorial(10));

  print("nilai faktorial dari 20");
  print(fungsiFaktorial(20));

  print("nilai faktorial dari 30");
  print(fungsiFaktorial(30));
}

int fungsiFaktorial(int n) {
  if (n > 1) {
    return n * fungsiFaktorial(n - 1);
  } else {
    return 1;
  }
}
