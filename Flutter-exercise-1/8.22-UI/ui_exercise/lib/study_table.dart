import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui_exercise/book_record_page.dart';
import 'package:ui_exercise/home_page.dart';
import 'package:ui_exercise/topic_list_page.dart';
import 'package:ui_exercise/utils.dart';

class StudyTable extends StatelessWidget {
  StudyTable(this.topic, this.studyType, this.title, {Key key}) : super(key: key);

  final Topic topic;
  final String studyType;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _title(),
        _table(),
        _button(context),
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
      stream: getRecords(topic.id, studyType).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
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
            ..._buildRows(snapshot.data.docs),
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

  Widget _button(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FlatButton(
        child: Text("新增", style: TextStyle(fontSize:18),),
        onPressed: () {
          goTo(context, _getPage(false, null));
        },
        color: Colors.amberAccent,
//      height: 30.0,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }

  List<TableRow> _buildRows(List<QueryDocumentSnapshot> snapshots) {
    int i = 0;
    List<TableRow> rows = snapshots.map((snapshot) {
      final Map<String, dynamic> data = snapshot.data();
      final recordId = snapshot.id;
      final DateTime startTime = data["startTime"].toDate();
      final DateTime endTime = data["endTime"].toDate();
      final hours = endTime.difference(startTime).inMinutes / 60.0;
      i++;
      return TableRow(children: [
        paddingText(i.toString()),
        paddingText(data["name"]),
        paddingText(data["review"]),
        paddingText(hours.toStringAsFixed(1)),
        Builder(
          builder: (context) => IconButton(icon: Icon(Icons.remove_red_eye), onPressed: () {
            goTo(context, _getPage(true, recordId));
          }),
        ),
      ]);
    }).toList();

    return rows;
  }

  Widget _getPage(bool readOnly, String recordId) {
    switch(studyType) {
      case "BOOK": return BookRecordPage(topic: topic, studyType: studyType, readOnly: readOnly, recordId: recordId);
    }
  }
}
