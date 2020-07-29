## 05-Loop
### playground15.dart
* Loop
#### Code
```
void main() {
  // Standard for loop
  for (var i = 1; i <= 10; ++i) {
    print(i);
  }
}
```

#### Output
```
1
2
3
4
5
6
7
8
9
10
```

### playground16.dart
#### Code
```
void main() {
  // for-in loop
  var numbers = [1, 2, 3];

  for (var n in numbers) {
    print(n);
  }

  for (var i = 0; i < numbers.length; ++i) {
    print(numbers[i]);
  }
}
```

#### Output
```
1
2
3
1
2
3
```

### playground17.dart
#### Code
```
void main() {
  // forEach loop
  var numbers = [1, 2, 3];

  numbers.forEach((n) => print(num));
}
```

#### Output
```
num
num
num
```


### playground18.dart
#### Code
```
void main() {
  // forEach loop
  var numbers = [1, 2, 3];

  numbers.forEach((n) => print(n));
}
```

#### Output
```
1
2
3
```


### playground19.dart
#### Code
```
void main() {
  // forEach loop
  var numbers = [1, 2, 3];

  numbers.forEach(printNum);
}

void printNum(num) {
  print(num);
}
```

#### Output
```
1
2
3
```



### playground20.dart
#### Code
```
void main() {
  // while loop
  int num = 5;

  while (num > 0) {
    print(num);
    num -= 1;
  }
}
```
#### Output
```
5
4
3
2
1
```


### playground21.dart
#### Code
```
void main() {
  for (var i = 0; i < 10; ++i) {
    if (i > 5) break;
    print(i);
  }
}
```
#### Output
```
0
1
2
3
4
5
```


### playground22.dart
#### Code
```
void main() {
  for (var i = 0; i < 10; ++i) {
    if (i % 2 == 0) continue;
    print('Odd: $i');
  }
}
```

#### Output
```
Odd: 1
Odd: 3
Odd: 5
Odd: 7
Odd: 9
```