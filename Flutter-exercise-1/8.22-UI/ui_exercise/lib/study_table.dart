import 'package:flutter/material.dart';

class StudyTable extends StatelessWidget {
  final String title;

  const StudyTable({Key key, this.title}) : super(key: key);

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
    return Text(title, style: TextStyle(fontSize: 24));
  }

  Widget _table() {
    return Table(
      border: TableBorder.all(),
      children: [
        TableRow(children: [
          Container(),
          paddingText("書名"),
          paddingText("心得"),
          paddingText("學習時數"),
          paddingText("狀態"),
        ], decoration: BoxDecoration(color: Colors.orange)),
        ..._buildRows(),
      ],
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
    return FlatButton(
      child: Text("新增"),
      onPressed: () {},
      color: Colors.yellow,
      minWidth: 450.0,
      height: 30.0,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  List<TableRow> _buildRows() {
    List<TableRow> rows = records.map((e) {
      return TableRow(children: [
        paddingText(e.index.toString()),
        paddingText(e.name),
        paddingText(e.review),
        paddingText(e.hours.toString()),
        Container()
      ]);
    }).toList();

    return rows;
  }
}

class Record {
  final int index;
  final String name;
  final String review;
  final double hours;

  Record(this.index, this.name, this.review, this.hours);
}

final records = [
  Record(1, "AA", "aa", 1.5),
  Record(2, "BB", "bb", 1.5),
  Record(3, "CC", "cc", 1.5),
];
