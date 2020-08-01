// Class

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
