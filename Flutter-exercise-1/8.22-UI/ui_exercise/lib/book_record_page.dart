import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:ui_exercise/topic_detail_page.dart';
import 'package:ui_exercise/topic_list_page.dart';
import 'package:ui_exercise/utils.dart';
import 'package:path/path.dart';

class BookRecordPage extends StatelessWidget {

  BookRecordPage({Key key, this.topic, this.studyType, this.readOnly, this.recordId}) : super(key: key);

  final Topic topic;
  final String studyType;
  final bool readOnly;
  final String recordId;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: getRecords(topic.id, studyType).doc(recordId).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        final data = snapshot.data.data();
        data?.forEach((key, value) {
          if (value is Timestamp) {
            data[key] = value.toDate();
          }
        });
        final formKey = GlobalKey<FormBuilderState>();
        return Scaffold(
          appBar: MyAppBar(topic.name, [
            if (readOnly) ...[
              IconButton(icon: Icon(Icons.edit), onPressed: () => _onEdit(context)),
              IconButton(icon: Icon(Icons.delete), onPressed: () => _onDelete(context)),
            ] else ...[
              IconButton(icon: Icon(Icons.save), onPressed: () => _onSave(context, formKey)),
            ]
          ]),
          body: _buildForm(data, formKey),
        );
      },
    );
  }

  Widget _buildForm(Map<String, dynamic> data, GlobalKey<FormBuilderState> formKey) {
    return FormBuilder(
      key: formKey,
      readOnly: readOnly,
      initialValue: data,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              FormBuilderTextField(
                attribute: 'name',
                decoration: InputDecoration(labelText: '名稱', labelStyle: TextStyle()),
                style: TextStyle(),
                validators: [
                  FormBuilderValidators.required(errorText: '請輸入名稱'),
                ],
              ),
              FormBuilderDateTimePicker(
                attribute: 'date',
                inputType: InputType.date,
                format: DateFormat('yyyy/MM/dd'),
                decoration: InputDecoration(labelText: '日期'),
              ),
              Row(children: [
                Expanded(
                  child: _buildTimeField('startTime', '開始時間'),
                ),
                Expanded(
                  child: _buildTimeField('endTime', '結束時間'),
                ),
              ]),
              FormBuilderImagePicker(
                attribute: 'images',
              ),
              Container(
                height: 200,
                child: FormBuilderTextField(
                  attribute: 'review',
                  decoration: InputDecoration(labelText: '心得', labelStyle: TextStyle()),
                  style: TextStyle(),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FormBuilderDateTimePicker _buildTimeField(String attribute, String labelText) {
    return FormBuilderDateTimePicker(
                  attribute: attribute,
                  inputType: InputType.time,
                  format: DateFormat('HH:mm'),
                  decoration: InputDecoration(labelText: labelText),
                  validators: [
                    FormBuilderValidators.required(),
                  ],
                );
  }

  void _onSave(BuildContext context, GlobalKey<FormBuilderState> formKey) async {
    if (!formKey.currentState.saveAndValidate()) {
      return;
    }
    final data = formKey.currentState.value;
    final List<File> images = data["images"].cast<File>().toList();
    final urls = await _uploadImages(images);
    data["images"] = urls;

    if (recordId == null) {
      getRecords(topic.id, studyType).add(data);
    } else {
      getRecords(topic.id, studyType).doc(recordId).set(data);
    }
    Navigator.of(context).pop();
  }

  void _onEdit(BuildContext context) {
    goTo(context, BookRecordPage(topic: topic, studyType: studyType, readOnly: false, recordId: recordId));
  }

  void _onDelete(BuildContext context) {
    getRecords(topic.id, studyType).doc(recordId).delete();
    Navigator.of(context).pop();
  }

  Future<List<String>> _uploadImages(List<File> images) async {
    final StorageReference storageReference = FirebaseStorage().ref();
    final List<Future<StorageTaskSnapshot>> results = images
        .map((image) => storageReference.child(basename(image.path)).putFile(image).onComplete)
        .toList();
    final List<StorageTaskSnapshot> snapshots = await Future.wait(results);
    final List<Future<String>> urls = snapshots.map((snapshot) => snapshot.ref.getDownloadURL().then((url) => url.toString())).toList();
    return await Future.wait(urls);
  }
}
