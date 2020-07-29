## 04-Operators
### playground9.dart
#### Code
```
void main() {
  int num = 10 + 22;
  num = num - 2;

  print(num);

  num = num % 5;
  print(num);

  // relational ==, !=, >=, <=
  if (num == 0) {
    print('Zero');
  }

  num = 100;
  num *= 2; // num = num * 2
  print(num);

  // unary operator
  ++num;
  num++;
  num += 1;
  num -= 1;
  print(num);

  // logical && and logical ||
  if (num > 200 && num < 203) {
    print('200 to 202');
  }

  // != Not Equal
  if (num != 100) {
    print('num is not equal to 100');
  }
}
```

#### Output
```
30
0
Zero
200
202
200 to 202
num is not equal to 100
```

### playground10.dart
* Null Aware Operator
* (?.), (??), (??=)
#### Code
```
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
```
#### Output
```
10
10
0
100   /* ??= */
100
```

### playground11.dart
* Ternary operator
#### Code
```
void main() {
  int x = 100;
  var result = x % 2 == 0 ? 'Even' : 'Odd';
  print(result);
}
```

#### Output
```
Even
```

### playground12.dart
* Type test
#### Code
```
void main() {
  int x = 100;

  if (x is int) {
    print('integer');
  }
}
```

#### Output
```
integer
```

### playground13.dart
* Conditional Statement
#### Code
```
void main() {
  int number = 100;

  if (number % 2 == 0) {
    print('Even');
  } else if (number % 3 == 0) {
    print('Odd');
  } else {
    print('Confused');
  }
}
```

#### Output
```
Even
```

### playground14.dart
* Conditional Statement
#### Code
```
void main() {
  int number = 20;
  switch (number) {
    case 0:
      print('Even');
      break;

    case 1:
      print('Odd');
      break;

    default:
      print('Confused');
  }
}
```

#### Output
```
Confused
```