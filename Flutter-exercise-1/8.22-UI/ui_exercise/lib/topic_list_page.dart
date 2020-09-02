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

  Padding _buildDescription(List<String> descriptions, int i) {
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: descriptions.map((e) {
                i++;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$i. "),
                      Expanded(child: Text(e)),
                    ]
                );
              }).toList(),
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