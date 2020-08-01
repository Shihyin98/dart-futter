## 09-Exception Handling
### playground44.dart
#### Code
```Dart
int mustGreaterThanZero(int val) {
  if (val <= 0) {
    throw Exception('Value must be greater than zero');
  }
  return val;
}

void letVerifyTheValue(var val) {
  var valueVerification;

  try {
    valueVerification = mustGreaterThanZero(val);
  } catch (e) {
    print(e);
  } finally {
    if (valueVerification == null) {
      print('Value is not accepted');
    } else {
      print('Value verified: $valueVerification');
    }
  }
}

void main() {
  letVerifyTheValue(10);
  letVerifyTheValue(0);
}

```

#### Output
```
Value verified: 10
Exception: Value must be greater than zero
Value is not accepted
```