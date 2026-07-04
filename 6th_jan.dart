main() {
  int ab = 10;
  int cd = 20;
  int jj = 34;
  String ef = "Hello, Dart!";
  String ef2 = "Hello, Dart!";
  bool gh = true;
  bool gh2 = true;

//          ----------false---------                            false
  var xy = ((ab * cd + jj ~/ cd) < cd) && !((ab ~/ cd) > (cd + ab) || (ef == ef2) || 
  // false
  (ef != ef2));

  print(xy);
  print(xy.runtimeType);

  String stdName1 = "Abid";
  String stdName2 = "Sarosh";
  String stdName3 = "Saifullah";
  // ...

  List<String> stdNames = ["Abid", "Huzaifa", "Sarosh", "Saifullah"];
  List<int> stdMarks = [45, 50, 49, 35];

}