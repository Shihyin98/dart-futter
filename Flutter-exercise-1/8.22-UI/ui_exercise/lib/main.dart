import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello'),
          actions: [
            Image.asset('assets/person.png'),
            Image.asset('assets/person.png'),
          ],
        ),
      ),
    );
  }
}
