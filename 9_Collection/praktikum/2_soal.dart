void main(List<String> args) {
  var emptyMap = {};
  var myList = [
    [1, 2, 3],
    ['A', 'B', 'C']
  ];

  print("Data List $myList");

  emptyMap[myList[0][0]] = myList[1][0];
  emptyMap[myList[0][1]] = myList[1][1];
  emptyMap[myList[0][2]] = myList[1][2];

  print("Diubah menjadi map => $emptyMap");
  var allKeys = emptyMap.keys;
  var allValues = emptyMap.values;

  print("Keys : $allKeys");
  print("Values : $allValues");

}
