import 'package:flutter/material.dart';
import 'package:ui_exercise/topic_detail_page.dart';

class TopicListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("Topic List"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.access_time),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => TopicDetailPage()));
        },
      ),
    );
  }
}
