import 'package:flutter/material.dart';
import 'package:iknoweverything/pages/question_answer.dart';
import 'package:get/get.dart';


void main() {
  runApp(IKnowEverythingApp());
}

class IKnowEverythingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Haha Desmond',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: QuestionAnswerPage(),
    );
  }
}
