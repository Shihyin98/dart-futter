import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
            body: Center(
              child: Container(height: 200.0, child: MyList()
                  /* new ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    new Container(
                      width: 180.0,
                      color: Colors.lightBlue,
                    ),
                    new Container(
                      width: 180.0,
                      color: Colors.amber,
                    ),
                    new Container(
                      width: 180.0,
                      color: Colors.deepOrange,
                    ),
                    new Container(
                      width: 180.0,
                      color: Colors.deepPurpleAccent,
                    )
                  ],
                ),*/
                  ),
            )));
  }
}

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        new Container(
          width: 180.0,
          color: Colors.lightBlue,
        ),
        new Container(
          width: 180.0,
          color: Colors.amber,
        ),
        new Container(
          width: 180.0,
          color: Colors.deepOrange,
        ),
        new Container(
          width: 180.0,
          color: Colors.deepPurpleAccent,
        )
      ],
    );
  }
}
