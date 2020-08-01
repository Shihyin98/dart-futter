import 'package:flutter/material.dart';
// 引入樣式包，基礎樣式。 material.dart

void main() => runApp(MyApp());
// runAPP() 執行App

//繼承靜態組件
class MyApp extends StatelessWidget {
  // 重寫
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
            // 上面的藍條
            appBar: AppBar(
              title: Text('Hello World'),
            ),
            body: Center(
              child: Text('Hello World!'),
            )));
  }
}
