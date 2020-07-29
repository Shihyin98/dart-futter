// Class

class X {
  final name; // type will be defined by inferred value
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
