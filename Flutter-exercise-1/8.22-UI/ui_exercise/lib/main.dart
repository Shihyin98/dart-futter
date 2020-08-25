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
          centerTitle: true,
          title: Text('金門學概論APP'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(6),
              child: Image.asset('assets/person.png'),
            )
          ],
        ),
        body: ListView(
          children: [
            StudyTable(title: '書籍閱讀: 3, 累計時數: 7'),
            StudyTable(title: '講座分享: 1, 累計時數: 2'),
          ],
        ),
      ),
    );
  }
}
