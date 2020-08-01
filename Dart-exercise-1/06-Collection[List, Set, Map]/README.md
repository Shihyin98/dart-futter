## 06-Collection[List, Set, Map]
### playground23.dart
#### Code
```Dart
void main() {
  // List
  List names = ['Jack', 'Jill', 10, 100.1];

  // Only Type: String
  // List<String> names = ['Jack', 'Jill'];
  print(names[0]);
  print(names.length);

  for (var n in names) {
    print(n);
  }

  names[1] = 'Mark';

  for (var n in names) {
    print(n);
  }

  var names2 = [...names];
  names[0] = 'Marry';

  for (var n in names2) {
    print(n);
  }
}
```
#### Output

```
Jack
4
Jack
Jill
10
100.1
Jack
Mark
10
100.1
Jack
Mark
10
100.1
```


### playground24.dart
#### Code
```Dart
void main() {
  // Set
  var halogens = {'fluorine', 'chlorine'};

  for (var x in halogens) {
    print(x);
  }
}
```
#### Output
```
fluorine
chlorine
```

### playground25.dart
#### Code
```Dart
void main() {
  // Map
  var gifts = {
    // Key:     Value
    'first': 'partridge',
    'secend': 'turtledoves',
    'fifth': 'golden rings'
  };
  print(gifts['fifth']);
}
```
#### Output
```
golden rings
```

### playground26.dart
#### Code
```Dart
void main() {
  // Map
  var gifts = {
    // Key:     Value
    2: 'partridge',
    1: 'turtledoves',
    3: 'golden rings'
  };
  print(gifts[1]);
}
```
#### Output
```
turtledoves
```

### playground27.dart
#### Code
```Dart
void main() {
  // Map
  var gifts = Map();
  gifts['first'] = 'Mongo';

  print(gifts['first']);
}
```
#### Output
```
Mongo
```

### playground28.dart
#### Code
```Dart
void main() {
  // Map
  var gifts = {'first': 'Mongo', 'second': 'Jack Fruit'};

  print(gifts['second']);
}
```
#### Output
```
Jack Fruit
```