Future<dynamic> pengaliList(List mylist, int pengali) async {
  await Future.delayed(Duration(seconds: 1), () {
    List newList = [];
    for (var mylist in mylist) {
      newList.add(mylist * pengali);
    }
    print(newList);
    return newList;
  });
}

void main(List<String> args) async {
  List baru = [1, 2, 3];
  print('\nList lama');
  print(baru);
  print('List baru');
  await pengaliList(baru, 2);
}
