import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ui_exercise/topic_list_page.dart';

final googleSignIn = GoogleSignIn();

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.jpg"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.grey.withOpacity(0.5),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(2, 2),
                        blurRadius: 5,
                        spreadRadius: 5,
                      ),
                    ]),
                child: Text(
                  "FOO",
                  style: TextStyle(fontSize: 24, shadows: [
                    Shadow(
                      color: Colors.grey,
                      offset: Offset(2, 2),
                    ),
                  ]),
                ),
              ),
              Text("BAR"),
              FlatButton(
                onPressed: () async {
                  await googleSignIn.signIn();
                  _goToTopicList(context);
                },
                child: Text("LOGIN"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _goToTopicList(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TopicListPage()));
  }
}