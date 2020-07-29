## Other exercise
### object.dart
#### Code
```Dart
class Person {
  int age;
  String name;
  double bmi;
  // 設計框架
  // 物件導向

  Person(this.age, this.name, this.bmi) {}
}

void main() {
  var p = Person(45, 'Hank', 23.5);
  print(p);
}
```

### print.dart
#### Code
```Dart
main() {
  print('hello world');
}
```
#### Output

```
hello world
```


### test.dart
#### Code
```Dart
void main() {
  print('Hello');

  int age = 19;
  double bmi = 22.567;
  var bmi2 = 22.567;
  String name = 'Hank';

  print(age + bmi + bmi2);
  print(name);
}
```
#### Output

```
Hello
64.134
Hank
```
