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
              image: AssetImage("assets/background.png"), fit: BoxFit.cover)),
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
                      offset: Offset(3, 4),
                      blurRadius: 5,
                      spreadRadius: 5,
                    ),
                  ],),
                child: Text(
                  "國立金門大學",
                  style: TextStyle(fontSize: 24, shadows: [
                    Shadow(
                      color: Colors.grey,
                      offset: Offset(2, 2),
                    ),
                  ]),
                ),
              ),
              Text("作業繳交平台"),
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
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => TopicListPage()));
  }
}