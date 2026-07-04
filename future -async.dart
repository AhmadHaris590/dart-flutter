// void main() async {        // async = "this function will have waiting inside"
//   print('Start');

//   String result = await getData();  // await = "pause HERE until Future completes"

//   print(result);           // only runs after data arrives
//   print('End');
// }

// Future<String> getData() {
//   // pretend this takes 3 seconds
//   return Future.delayed(Duration(seconds: 3), () {
//     return 'Hello from internet!';
//   });
// }

// void main() {
//   printData();
//   add();
//   print("dekho");
// }

// Future<String> getData() {
//   return Future.delayed(Duration(seconds: 3), () => "hello wahaj");
// }

// void add() {
//   print("2+3 = ${2 + 3}");
// }

void main() {
  print("before async");
  printData();
  print("after async");
}

void printData() async {
  final data = await getData();
  print(data);
}

Future<String> getData() {
  return Future.delayed(Duration(seconds: 3), () => "hellow khuzaima");
}
