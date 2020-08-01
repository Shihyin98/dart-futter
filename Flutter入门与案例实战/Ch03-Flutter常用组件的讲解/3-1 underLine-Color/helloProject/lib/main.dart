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
            // 上面的藍條
            appBar: AppBar(
              title: Text('TextWidget'),
            ),
            body: Center(
                child: Text(
                    'Flutter 是**谷歌的移动UI框架**，可以快速在IOS和Android上构建高质量的原生用户界面。Flutter可以与现有的代码一起工作，并且它是免费、开源的。 --- 《官方介紹》',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Color.fromARGB(255, 255, 150, 150),
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid)))));
  }
}
