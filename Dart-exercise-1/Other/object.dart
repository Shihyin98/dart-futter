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
