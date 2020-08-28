import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui_exercise/home_page.dart';

class StudyTable extends StatelessWidget {
  StudyTable(this.topicId, this.studyType, this.title, {Key key}) : super(key: key);

  final String topicId;
  final String studyType;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _title(),
        _table(),
        _button(),
      ],
    );
  }

  Widget _title() {
    return Padding(
        padding: EdgeInsets.all(15.0),
        child:Text(title, style: TextStyle(fontSize:24)),);
  }

  Widget _table() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("users").doc(googleSignIn.currentUser.id)
          .collection("topics").doc(topicId)
          .collection("studyTypes").doc(studyType)
          .collection("records").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        final records = snapshot.data.docs.map(_toRecord).toList();
        double sum = 0;
        records.forEach((record) { sum+=record.hours; });
        print("TOTAL HOURS: "+sum.toString());
        return Table(
          border: TableBorder.all(),
          children: [
            TableRow(children: [
              Container(),
              paddingText("書名"),
              paddingText("心得"),
              paddingText("學習時數"),
              paddingText("狀態"),
            ], decoration: BoxDecoration(color: Colors.orangeAccent)),
            ..._buildRows(records),
          ],
        );
      }
    );
  }

  Widget paddingText(String text) {
    return Center(
      child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text),
          ),
    );
  }

  Widget _button() {
    return SizedBox(
      width: double.infinity,
      child: FlatButton(
        child: Text("新增", style: TextStyle(fontSize:18),),
        onPressed: () {
          FirebaseFirestore.instance
              .collection("users").doc(googleSignIn.currentUser.id)
              .collection("topics").doc(topicId)
              .collection("studyTypes").doc(studyType)
              .collection("records").add({
            "name": "record1",
            "review": "review1",
            "hours": 1.5
          });
        },
        color: Colors.amberAccent,
//      height: 30.0,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }

  List<TableRow> _buildRows(List<Record> records) {
    int i = 0;
    List<TableRow> rows = records.map((record) {
      i++;
      return TableRow(children: [
        paddingText(i.toString()),
        paddingText(record.name),
        paddingText(record.review),
        paddingText(record.hours.toString()),
        Container()
      ]);
    }).toList();

    return rows;
  }

  Record _toRecord(QueryDocumentSnapshot snapshot) {
    final data = snapshot.data();
    return Record(
      data["name"],
      data["review"],
      data["hours"]
    );
  }
}

class Record {
  final String name;
  final String review;
  final double hours;

  Record(this.name, this.review, this.hours);
}
