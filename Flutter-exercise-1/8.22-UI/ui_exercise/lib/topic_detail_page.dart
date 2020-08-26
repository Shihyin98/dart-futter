import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ui_exercise/home_page.dart';
import 'package:ui_exercise/study_table.dart';

class TopicDetailPage extends StatelessWidget {
  const TopicDetailPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('金門學概論APP'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              switch(value) {
                case 1:
                  googleSignIn.signOut();
                  break;
                case 2:
                  break;
                default:
                  return;
              }
            },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 0,
                      child: Text("FOO"),
                    ),
                    PopupMenuItem(
                      value: 1,
                      child: Text("BAR"),
                    ),
                  ],
              icon: AspectRatio(
                aspectRatio: 1,
                  child: GoogleUserCircleAvatar(identity: googleSignIn.currentUser),
              )),
        ],
      ),
      body: ListView(
        children: [
          StudyTable(title: '書籍閱讀: 3, 累計時數: 7'),
          StudyTable(title: '講座分享: 1, 累計時數: 2'),
        ],
      ),
    );
  }
}
