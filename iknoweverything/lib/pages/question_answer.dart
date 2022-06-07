import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iknoweverything/controller/gradeController.dart';
import 'package:iknoweverything/models/answer.dart';
import 'package:get/get.dart';

class QuestionAnswerPage extends StatefulWidget {
  @override
  _QuestionAnswerPageState createState() => _QuestionAnswerPageState();
}

class _QuestionAnswerPageState extends State<QuestionAnswerPage> {
  /// Text editing controlller for question text field
  TextEditingController _questionFieldController = TextEditingController();

  /// To store the current answer object
  Answer _currentAnswer;

  /// Scaffold key
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /// Handle the process of getting a yes/no answer
  _handleGetAnswer() async {
    String questionText = _questionFieldController.text?.trim();
    if (questionText == null ||
        questionText.length == 0 ||
        questionText[questionText.length - 1] != '?') {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Please ask a valid question.'),
        duration: Duration(seconds: 2),
      ));
      return;
    }
    try {
      http.Response response = await http.get('https://yesno.wtf/api');
      if (response.statusCode == 200 && response.body != null) {
        Map<String, dynamic> responseBody = json.decode(response.body);
        Answer answer = Answer.fromMap(responseBody);
        setState(() {
          _currentAnswer = answer;
        });
      }
    } catch (err, stacktrace) {
      print(err);
      print(stacktrace);
    }
  }

  /// handle reset operation
  _handleResetOperation() {
    _questionFieldController.text = '';
    setState(() {
      _currentAnswer = null;
    });
  }


  //My impl : Set image
  String grade = null;
  final GradeCotroller gradecontroller = Get.put(GradeCotroller());
  void _setimageA(){
      grade = 'A';
      print(grade);
  }
   void _setimageB(){
      grade = 'B';
      print(grade);
  }
   void _setimageC(){
      grade = 'C';
      print(grade);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('COMP2211 Course Website'),
        elevation: 0,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
      child : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(height: 50),
          Text('Bad guy Desmond',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment : MainAxisAlignment.center ,
            children: [
              Image.asset('images/IMG-20220604-WA0004.jpg'),
              SizedBox(
                width: 30,
              ),
              Column(
                children:[
                Container(
                  height : 50,
                  width: 0.2 * MediaQuery.of(context).size.width,
                  color : Colors.red,
                  child: TextField(
                  controller: _questionFieldController,
                  decoration: InputDecoration(
                  labelText: 'COMP2211 grade F', border: OutlineInputBorder()),
                )),
                SizedBox(height : 50),
                Text(
                  'Your COMP2211 grade'
                ),
                SizedBox(height: 20),
                Row(
                  children:[
                    RaisedButton(
                      onPressed: (){_setimageA();setState(() {});},
                      color : Colors.blue,
                      child : Text('A')
                    ),
                    SizedBox(width:20),
                    RaisedButton(
                      onPressed: (){_setimageB();setState(() {});},
                      color : Colors.red,
                      child : Text('B')
                    ),
                    SizedBox(width:20),
                    RaisedButton(
                      onPressed: (){_setimageC();setState(() {});},
                      color : Colors.amber,
                      child : Text('C')
                    )]
                ),
               ]
              ),
            ]
          ),
          SizedBox(
            height: 20,
          ),
          Text('Your COMP2211 grade is : '+gradecontroller.grade.value),
           SizedBox(
            height: 20,
          ),

          if (grade=='A')
            Container(
                  height : 400,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      //image: NetworkImage(_currentAnswer.image),
                      image: NetworkImage('images/de50d7af59a21e04e31cd0b82d40f80a.jpg')
                    ),
                  )
                  
            ),

          if (grade=='B')
            Container(
                  height : 400,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      //image: NetworkImage(_currentAnswer.image),
                      image: NetworkImage('images/85ac1264e77e338d659c549a0be45d34.jpg')
                    ),
                  )
            ),

        if (grade=='C')
          Container(
                  height : 400,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      //image: NetworkImage(_currentAnswer.image),
                      image: NetworkImage('images/IMG-20220604-WA0004.jpg')
                    ),
                  )
          ),




          if (_currentAnswer != null)
            Stack(
              children: [
                Container(
                  height: 250,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      //image: NetworkImage(_currentAnswer.image),
                      image: NetworkImage('images/IMG-20220604-WA0004.jpg')
                    ),
                  ),
                ),
                Positioned.fill(
                    bottom: 20,
                    right: 20,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        _currentAnswer.answer.toUpperCase(),
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    )),
              ],
            ),
          if (_currentAnswer != null)
            SizedBox(
              height: 20,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: _handleGetAnswer,
                child: Text(
                  'Get Answer',
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              RaisedButton(
                onPressed: _handleResetOperation,
                child: Text(
                  'Reset',
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
