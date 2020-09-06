import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:ui_exercise/home_page.dart';
import 'package:ui_exercise/topic_detail_page.dart';
import 'package:ui_exercise/utils.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' show BaseRequest, Response;
import 'package:http/io_client.dart';

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
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          child: Icon(Icons.cloud_upload),
          onPressed: () async {
            final data = await FirebaseFirestore.instance.collection('users').doc(googleSignIn.currentUser.id).get();
            final genResponse = await post(
              'https://us-central1-nqu-app.cloudfunctions.net/genDocx',
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                'username': googleSignIn.currentUser.displayName,
              }),
            );

            var client = GoogleHttpClient(await googleSignIn.currentUser.authHeaders);
            var drive = DriveApi(client);

            var response = await drive.files.create(
              File()..name = 'output.docx',
              uploadMedia: Media(
                Stream.value(genResponse.bodyBytes),
                genResponse.contentLength,
              ),
            );

            print(response.toJson());
            // final task = FirebaseStorage.instance.ref().child('output.docx').putData(genResponse.bodyBytes);
            // final snapshot = await task.onComplete;
            // final url = await snapshot.ref.getDownloadURL();
            // print(url);
            Scaffold.of(context).showSnackBar(SnackBar(content: Text("Upload Completed")));
          },
        ),
      ),
    );
  }

  Padding _buildDescription(List<String> descriptions, int i) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: descriptions.map((e) {
          i++;
          return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("$i. "),
            Expanded(child: Text(e)),
          ]);
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

class GoogleHttpClient extends IOClient {
  Map<String, String> _headers;

  GoogleHttpClient(this._headers) : super();

  @override
  Future<IOStreamedResponse> send(BaseRequest request) => super.send(request..headers.addAll(_headers));

  @override
  Future<Response> head(Object url, {Map<String, String> headers}) =>
      super.head(url, headers: headers..addAll(_headers));
}
