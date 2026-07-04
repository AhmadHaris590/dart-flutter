void main() {
  // break and continue
  // for (var i = 0; i < 4; i++) {
  //   for (int j = 1; j <= 10; j++) {
  //     if (j == 5) {
  //       break; // Exit the j loop entirely when i is 5
  //     }
  //     print('Current number: i:$i j:$j');
  //   }
  // }

  // for (int i = 1; i <= 10; i++) {
  //   if (i == 5) {
  //     continue; // Skip the rest of the current iteration when i is 5
  //   }
  //   print('Current number: $i');
  // }

  /// PRINT VARIABLES
  // int i = 0;
  // print("This is $i"); // This is 0
  // print("This is $i+1"); // This is 0+1
  // print("This is ${i+1}"); // This is 1

  /// TYPE CASTING
  // String a = "Hi";
  // var b = int.tryParse(a);
  // var c = int.parse(a);
  // print(b); // null
  // print(c); // null

  // List<int> a = [4, 4];
  // String b = a.toString();
  // print(b[0]); // prints [

  // / CONST VS FINAL
  // final List<int> a = [4, 5];
  // const List<int> b = [6, 7];
  // a.add(9);
  // print(a);
  // a.add(10);
  // print(a);
  // a.add(11);
  // print(a);
  // b.add(10);
  // print(b);

  // / DYNAMIC VS OBJECT
  // dynamic a = 4;
  // a = "hi";
  // print(a.isEven);
  // Object b = "hy";
  // b = 5;
  // print((b as int).isEven);
  // print(b.toString());

  /// NULL SAFETY
  // int? a = null;
  // if (a != null) {
  //   var c = a.abs();
  //   print(c);
  // }

  // var c = a!.abs();
  // print(c);

  // var c = a?.abs();
  // print(c);

  // List<int?> abc = [4, null];
  List<int>? def = null;

  // print(def[0]);
  // if (def != null) {
  //   print(def[0]);
  // }

  // print(def![0]);

  // print(def?[0]);

  // int? a = 10;
  // int b = a ?? 2;

  // print(b);

  /// ERROR HANDLING
  // try {
  //   dynamic result = 12 ~/ 0;
  //   print(result);
  // } on IntegerDivisionByZeroException {
  //   print("You cannot divide by zero");
  // } on FormatException catch (e) {
  //   print("Format Exception: ${e.message}");
  // } catch (e) {
  //   print("Some other exception: $e");
  // }finally{
  //   print("sauli");
  // }

  // FUNCTIONS
  // hello();
  // greeting("Abdullah", "Morning");
  // greeting("Bilal", "Morning", "Good");
  // greeting(name: "Huzaifa");

  // int c = addNumbers(4, 5);

  // int Function(int, int) c = addNumbers;
  // print(c(4, 5));
}

// WITH NO RETURN TYPE (DYNAMIC) AND NO PARAMETERS
hello() {
  print("Hello Fluter");
}

// WITH PARAMETERS (Positional required) AND RETURN TYPE
int addNumbers(int a, int b) {
  return a + b;
}

// WITH PARAMETERS (NAMED required and optional with default value) AND NO RETURN TYPE (DYNAMIC)
// greeting({required String name, String time = "Afternoon"}) {
//   print("Good Afternoon, $name");
// }

// WITH PARAMETERS (Positional required and optional) AND NO RETURN TYPE (DYNAMIC)
// greeting(String name, [String? time]) {
//   print("Good $time, $name");
// }

// WITH PARAMETERS (Positional required and optional with default value) AND NO RETURN TYPE (DYNAMIC)
// greeting(String name, [String time = "Afternoon", String? event ]) {
//   print("Good $time, $name for $event" );
// }



//  final vs const:

// Final varioables are run time constant. Const variables are complile time constant.

// Final variale you can a variable at line 1. intialzie the value at line 50 etc cod will run.
// In const variables, it is necessary to initoizlze the value where it is declared . else error( const variables ant be initizled before it is declared)//

