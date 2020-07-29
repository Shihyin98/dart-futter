// Collection

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
