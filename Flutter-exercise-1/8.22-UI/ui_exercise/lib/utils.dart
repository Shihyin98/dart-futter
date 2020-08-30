import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui_exercise/home_page.dart';

CollectionReference getRecords(String topicId, String studyType) {
  return FirebaseFirestore.instance
      .collection("users").doc(googleSignIn.currentUser.id)
      .collection("topics").doc(topicId)
      .collection("studyTypes").doc(studyType)
      .collection("records");
}

void goTo(BuildContext context, Widget page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}