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
        title: 'TextWidget',
        home: Scaffold(
            appBar: AppBar(
              title: Text('TextWidget'),
            ),
            body: Center(
                child: Container(
              child: new Text('Hello Imooc', style: TextStyle(fontSize: 40.0)),
              alignment: Alignment.bottomRight,
              width: 300.0,
              height: 300.0,
              color: Colors.lightBlue,
            ))));
  }
}
