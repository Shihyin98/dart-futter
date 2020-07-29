## 02-Data Types
### playground3.dart
#### Code
```Dart
main() {
  int amount1 = 100;
  var amount2 = 200;

  print('Amount1: $amount1 | Amount2: $amount2 \n');

  double dAmount1 = 100.11;
  var dAmount2 = 200.22;

  print('dAmount1: $dAmount1 | dAmount2: $dAmount2 \n');

  String name1 = 'Mahmud';
  var name2 = 'Ahsan';

  print('My name is: $name1 $name2 \n');

  bool isItTrue1 = true;
  var isItTrue2 = false;

  print('isItTrue1: $isItTrue1 | isItTrue2: $isItTrue2 \n');

  dynamic weakVariable = 100;
  print('WeakVariable 1: $weakVariable \n');

  weakVariable = 'Dart Programming';
  print('WeakVariable 2: $weakVariable');
}

```

#### Output
```
Amount1: 100 | Amount2: 200

dAmount1: 100.11 | dAmount2: 200.22

My name is: Mahmud Ahsan

isItTrue1: true | isItTrue2: false

WeakVariable 1: 100

WeakVariable 2: Dart Programming
```