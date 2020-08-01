import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMooc Flutter Demo',
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('ListView Widget'),
        ),
        body: new ListView(children: <Widget>[
          new Image.network(
              'https://n.sinaimg.cn/transform/20141121/avxeafr4995788.jpg'),
          new Image.network(
              'https://i.ytimg.com/vi/7g_zGtH13LY/maxresdefault.jpg'),
          new Image.network('https://i.imgur.com/XoBbu9D.jpg'),
          new Image.network(
              'https://jefferic.files.wordpress.com/2015/03/penguins-of-madagascar.jpg'),
          /*
          new ListTile(
            leading: new Icon(Icons.favorite),
            title: new Text('favorite'),
          ), // 列表組件，返回一個數組
          new ListTile(
            leading: new Icon(Icons.audiotrack),
            title: new Text('audiotrack'),
          ),
          new ListTile(
            leading: new Icon(Icons.beach_access),
            title: new Text('beach_access'),
          ),
          new ListTile(
            leading: new Icon(Icons.android),
            title: new Text('android'),
          ),
          */
        ]),
      ),
    );
  }
}
