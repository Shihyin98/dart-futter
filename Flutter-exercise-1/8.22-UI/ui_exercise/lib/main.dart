import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ui_exercise/study_table.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
