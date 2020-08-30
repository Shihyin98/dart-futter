import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ui_exercise/home_page.dart';
import 'package:ui_exercise/study_table.dart';
import 'package:ui_exercise/topic_list_page.dart';

class TopicDetailPage extends StatelessWidget {
  const TopicDetailPage(this.topic, {Key key}) : super(key: key);

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(topic.name, []),
      body: ListView(
        children: [
          StudyTable(topic, 'BOOK', '書籍閱讀: 3, 累計時數: 7'),
          StudyTable(topic, 'SPEECH', '講座分享: 1, 累計時數: 2'),
        ],
      ),
    );
  }
}

class MyAppBar extends AppBar {
  MyAppBar(String titleText, List<Widget> actions) : super(
    title: Text(titleText),
    centerTitle: true,
    actions: [
      ...actions,
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
  );
}
