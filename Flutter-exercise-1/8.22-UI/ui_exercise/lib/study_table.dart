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
          Text("書名"),
          Text("心得"),
          Text("學習時數"),
          Text("狀態"),
        ], decoration: BoxDecoration(color: Colors.orange)),
        ..._buildRows(),
      ],
    );
  }

  Widget _button() {
    return FlatButton(
      child: Text("新增"),
      onPressed: () {},
      color: Colors.yellow,
      minWidth: 450.0,
      height: 30.0,
    );
  }

  List<TableRow> _buildRows() {
    List<TableRow> rows = records.map((e) {
      return TableRow(children: [
        Text(e.index.toString()),
        Text(e.name),
        Text(e.review),
        Text(e.hours.toString()),
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
