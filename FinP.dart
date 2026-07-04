void main() {
  double res = sauli(
    a: 2,
    b: 3,
    operation: (double c, double d) {
      return c + d;
    },
  );
  print(res);

  List<int> number = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List iseven = filterNumber(number, (num) {
    return num % 2 == 0;
  });
  print(iseven);

  print(
    MultiplyBy10(number, (num) {
      return num * 10;
    }),
  );
}

double sauli({
  required double a,
  required double b,
  required double Function(double, double) operation,
}) {
  return operation(a, b);
}

List<int> filterNumber(List number, bool Function(int) operation) {
  List<int> even = [];
  for (int num in number) {
    if (operation(num)) {
      even.add(num);
    }
  }
  return even;
}

List<int> MultiplyBy10(List<int> number, int Function(int) operation) {
  List<int> number10 = [];
  for (int num in number) {
    number10.add(operation(num));
  }

  return number10;
}
