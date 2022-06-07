import 'package:flutter/material.dart';
import 'package:iknoweverything/pages/question_answer.dart';

void main() {
  runApp(IKnowEverythingApp());
}

class IKnowEverythingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Haha Desmond',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: QuestionAnswerPage(),
    );
  }
}
