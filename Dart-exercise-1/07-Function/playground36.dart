// Function

void main() {
  print(sum(10));
  print(sum(10, num2: 2));
}

dynamic sum(var num1, {var num2 = 0}) => num1 + num2;
