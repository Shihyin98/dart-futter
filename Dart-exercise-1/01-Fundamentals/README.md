## 01-Fundamentals
### playground.dart
#### Code
```Dart
main() {
  var firstName = 'Mahmud';
  String lastName = 'Ahsan';

  print(firstName + ' ' + lastName);
}
```
#### Output
```
Mahmud Ahsan
```


### playground2.dart
#### Code
```Dart
main() {
  stdout.writeln('What is your name: ?');
  String name = stdin.readLineSync();
  print('My nae is $name');
}
```
#### Output

```
What is your name: ?
aa
My nae is aa
```

