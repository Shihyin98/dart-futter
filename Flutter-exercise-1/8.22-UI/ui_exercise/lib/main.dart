import 'package:flutter/material.dart';
import 'package:ui_exercise/study_table.dart';

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
            Padding(
              padding: const EdgeInsets.all(6),
              child: Image.asset('assets/person.png'),
            )
          ],
        ),
        body: ListView(
          children: [
            StudyTable(title: 'Book: 3, Hours: 7'),
            StudyTable(title: 'Book: 1, Hours: 2'),
          ],
        ),
      ),
    );
  }
}
