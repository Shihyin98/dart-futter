// Class

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
