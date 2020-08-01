// Null Aware Operator
// (?.), (??), (??=)

class Num {
  int num = 10;
}

main() {
  var n = Num();
  int number;

  if (n != null) {
    number = n.num;
  }

  print(number);

// part2 -- null error
  // var n2;
  // int number2;

  // number = n2.num;

  // print(number2);

// part3
  var n3 = Num();
  int number3;

  number3 = n3?.num;

  print(number3);

// part4
  var n4;
  int number4;

  number4 = n4?.num ?? 0;

  print(number4);

// part5
  int number5;
  print(number5 ??= 100);
  print(number5);
}
