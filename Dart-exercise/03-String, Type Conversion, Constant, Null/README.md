## 03-String, Type Conversion, Constant, Null
### playground4.dart
#### Code
```Dart
main() {
  var s1 = 'Single quotes work well for string literals.';
  var s2 = 'Double quotes work just as well.';
  var s3 = 'It\'s easy  to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";

  print(s1);
  print(s2);
  print(s3);
  print(s4);
  print('');

  //RAW String
  var s = r'In a raw string, not even \n gets special treatment.';
  print(s);
}
```

#### Output
```
Single quotes work well for string literals.
Double quotes work just as well.
It's easy  to escape the string delimiter.
It's even easier to use the other delimiter.

In a raw string, not even \n gets special treatment.
```

### playground5.dart
#### Code
```Dart
main() {
  var age = 35;
  var str = 'My age is : $age';
  print(str);
}
```
#### Output
```
My age is : 35
```

### playground6.dart
#### Code
```Dart
main() {
  var s1 = '''You can create multi-line strings like this one.
  ''';
  var s2 = """This is also a multi-line string.""";

  print(s1);

  print(s2);
}
```
#### Output
```
You can create multi-line strings like this one.

This is also a multi-line string.
```

### playground7.dart
* parse('1.1')
* [How do I parse a string into a number with Dart?](https://stackoverflow.com/questions/13167496/how-do-i-parse-a-string-into-a-number-with-dart)
* 3.14159.toStringAsFixed(2)
* [Dart 取两位小数 四舍五入的方法](https://blog.csdn.net/u013095264/article/details/103056322)
#### Code
```Dart
main() {
  // String -> int
  var one = int.parse('1');
  assert(one == 1);

  // String -> double
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);

  // int -> String
  String oneAsString = 1.toString();
  assert(oneAsString == '1');

  // double -> String
  String piAsString = 3.14159.toStringAsFixed(2);
  assert(piAsString == '3.14');
}
```

### playground8.dart
#### Code
```Dart
main() {
  const aConstNum = 0; // int constant
  const aConstBool = true; // bool constant
  const aConstString = 'a constant string'; // string constant

  print(aConstNum);
  print(aConstBool);
  print(aConstString);

  print(aConstNum.runtimeType);
  print(aConstBool.runtimeType);
  print(aConstString.runtimeType);
}
```

#### Output
```
0
true
a constant string
int
bool
String
```