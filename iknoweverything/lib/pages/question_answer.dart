import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iknoweverything/models/answer.dart';

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
                  labelText: 'Feedback of the course', border: OutlineInputBorder()),
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

          if (grade=='A')
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children:[
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
              Positioned(
                child:Text('Congratulations!',style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold)))
            ]
          ),

          if (grade=='B')
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children : [
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
              Positioned(
                child:Text('Not bad',style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold)))
            ]
          ),

        if (grade=='C')
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children : [
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
            Positioned(
              child:Text('GG nah hah',style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold)))
          ]
        )
      ]),
    ));
  }
}
