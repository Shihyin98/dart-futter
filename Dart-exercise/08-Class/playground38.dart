// Class

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
