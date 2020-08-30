import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui_exercise/topic_detail_page.dart';
import 'package:ui_exercise/utils.dart';

class TopicListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection("topics").get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final listTiles = snapshot.data.docs.map((doc) {
            final data = doc.data();
            final topic = Topic(doc.id, data["name"], data["description"]);
            return ListTile(
              title: Text(topic.name),
              subtitle: Text(topic.description),
              onTap: () {
                goTo(context, TopicDetailPage(topic));
              },
            );
          }).toList();
          return ListView(children: listTiles);
        },
      ),
    );
  }
}

class Topic {
  final String id;
  final String name;
  final String description;

  Topic(this.id, this.name, this.description);
}