## 08-Class
### playground37.dart
#### Code
```
class Person {
  String name;
  int age;

  void showOutput() {
    print(name);
    print(age);
  }
}

void main() {
  Person person1 = Person();
  person1.name = 'Mahmud';
  person1.age = 35;
  person1.showOutput();
}
```

#### Output
```
Mahmud
35
```


### playground38.dart
#### Code
```
class Person {
  String name;
  int age;

  Person(String name, [int age = 18]) {
    this.name = name;
    this.age = age;
  }

  void showOutput() {
    print(name);
    print(age);
  }
}

void main() {
  Person person1 = Person('Mahmud');
  person1.showOutput();

  Person person2 = Person('Mahmud', 35);
  person2.showOutput();
}
```

#### Output
```
Mahmud
18
Mahmud
35
```


### playground39.dart
#### Code
```
class Person {
  String name;
  int age;

  Person(this.name, [this.age = 18]);

  void showOutput() {
    print(name);
    print(age);
  }
}

void main() {
  Person person1 = Person('Mahmud');
  person1.showOutput();

  Person person2 = Person('Mahmud', 35);
  person2.showOutput();
}
```

#### Output
```
Mahmud
18
Mahmud
35
```


### playground40.dart
#### Code
```
class Person {
  String name;
  int age;

  Person(this.name, [this.age = 18]);

  // named constructor
  Person.guest() {
    name = 'Guest';
    age = 19;
  }

  void showOutput() {
    print(name);
    print(age);
  }
}

void main() {
  Person person1 = Person('Mahmud');
  person1.showOutput();

  var person2 = Person('Jack', 35);
  person2.showOutput();

  var person3 = Person.guest();
  person3.showOutput();
}
```

#### Output
```
Mahmud
18
Jack
35
Guest
19
```


### playground41.dart
* final: type will be defined by inferred value
#### Code
```
class X {
  final name;
  static const int age = 10;

  X(this.name);
}

void main() {
  var x = X('Jack');

  print(x.name);

  print(X.age);

  /* Wrong way
    x.name = 'Jill';
    print(x.name);
  */

  var y = X('Jill');
  print(y.name);
}
```

#### Output
```
Jack
10
Jill
```


### playground42.dart
* 通過 extends 創建 subclasses
* 通過 super 呼叫 parent Object
* [ Javascript 開發者必須知道的 10 個新功能_medium_peterchang](https://medium.com/@peterchang_82818/es6-10-features-javascript-developer-must-know-98b9782bef44)
* [super 語法_MDN Web Doc](https://developer.mozilla.org/zh-TW/docs/Web/JavaScript/Reference/Operators/super)
* [【Java】基本架構：屬性、方法、類別、變數、static_痞客邦_2016](https://tina0221.pixnet.net/blog/post/68326623)
* [物件導向設計：類別與物件_PPT](http://dns2.asia.edu.tw/~wzyang/slides/java/chen/se7ch07.pdf)
* [ES6 的 Class 、super 的特例與繼承](https://ithelp.ithome.com.tw/articles/10200658)

#### Code
```
// Class

class Vehicle {
  String model;
  int year;

  Vehicle(this.model, this.year) {
    print(this.model);
    print(this.year);
  }

  void showOutput() {
    print(model);
    print(year);
  }
}

class Car extends Vehicle {
  double price;

  Car(String model, int year, this.price) : super(model, year);

  void showOutput() {
    print(this.price);
  }
}

void main() {
  var car1 = Car('Accord', 2014, 150000);
  car1.showOutput();
}
```

#### Output
```
Accord
2014
150000.0
```


### playground43.dart
* Define two calculated properties: right and bottom.
#### Code
```
class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top + height;
  set bootom(num value) => top = value - height;
}

void main() {
  var rect = Rectangle(3, 4, 20, 15);
  print(rect.left);
  print(rect.right);
  print(rect.bottom);

  rect.right = 12;
  print(rect.left);
  print(rect.top);

  rect.bootom = 6;
  print(rect.top);
}
```

#### Output
```
3     // left
23    // right = left + width = 3 + 20
19    // bottom = top + height = 4 + 15
-8    // left = value - width = 12 - 20
4     // top = 4
-9    // top = value - height = 6 - 15
```