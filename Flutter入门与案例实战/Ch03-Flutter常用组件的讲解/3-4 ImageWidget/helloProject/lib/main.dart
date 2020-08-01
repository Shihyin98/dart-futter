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
        title: 'ImageWidget',
        home: Scaffold(
            appBar: AppBar(
              title: Text('ImageWidget'),
            ),
            body: Center(
              child: Container(
                child: new Image.network(
                  // FIXME-ok: Can't run up the image.
                  'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
                  scale: 2.0,
                  // fit: BoxFit.cover,
                  // color: Colors.greenAccent,
                  // colorBlendMode: BlendMode.screen,
                  repeat: ImageRepeat.repeatY,
                ),
                width: 300.0,
                height: 200.0,
                color: Colors.lightBlue,
              ),
            )));
  }
}
