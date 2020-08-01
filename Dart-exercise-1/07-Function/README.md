## 07-Function
### playground29.dart
#### Code
```Dart
void main() {
  showOutput(square(2));
  showOutput(square(2.5));

  print(square.runtimeType);
}

dynamic square(var num) {
  return num * num;
}

void showOutput(var msg) {
  print(msg);
}
```

#### Output
```
4
6.25
(dynamic) => dynamic
```


### playground30.dart
* Arrow Function  (=>)
* [箭頭函式 (Arrow functions)](https://wcc723.github.io/javascript/2017/12/21/javascript-es6-arrow-function/)
#### Code
```Dart
void main() {
  // Arrow Function    =>
  showOutput(square(2));
  showOutput(square(2.5));
}

dynamic square(var num) => num * num;

void showOutput(var msg) {
  print(msg);
}
```

#### Output
```
4
6.25
```


### playground31.dart
#### Code
```Dart
main() {
  var list = ['apples', 'bananas', 'oranges'];

  list.forEach(printF);
}

void printF(item) {
  print(item);
}
```

#### Output
```
apples
bananas
oranges
```


### playground32.dart
#### Code
```Dart
main() {
  var list = ['apples', 'bananas', 'oranges'];

  list.forEach((item) {
    print(item);
  });
}
```

#### Output
```
apples
bananas
oranges
```


### playground33.dart
#### Code
```Dart
void main() {
  print(sum(2, 2));
}

dynamic sum(var num1, var num2) => num1 + num2;
```

#### Output
```
4
```


### playground34.dart
#### Code
```Dart
void main() {
  print(sum(num2: 4, num1: 2));
}

dynamic sum({var num1, var num2}) => num1 + num2;
```

#### Output
```
6
```


### playground35.dart
#### Code
```Dart
void main() {
  print(sum(10, num2: 2));
}

dynamic sum(var num1, {var num2}) => num1 + num2;
```

#### Output
```
12
```


### playground36.dart
#### Code
```Dart
void main() {
  print(sum(10));
  print(sum(10, num2: 2));
}

dynamic sum(var num1, {var num2 = 0}) => num1 + num2;
```

#### Output
```
10
12
```