import 'package:flutter/material.dart';
import 'package:iknoweverything/controller/gradeController.dart';
import 'package:get/get.dart';
import 'package:iknoweverything/pages/question_answer.dart';

 
class gradePageB extends StatelessWidget{
    final GradeCotroller gradeController1 = Get.find();
    @override
    Widget build(BuildContext context){
        return Scaffold(
          body: Column(
            mainAxisAlignment : MainAxisAlignment.center,
            children: [
            Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children : [
              Container(
                  height : 400,
                  width: 800,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                    fit: BoxFit.cover,
                    //image: NetworkImage(_currentAnswer.image),
                    image: NetworkImage('images/85ac1264e77e338d659c549a0be45d34.jpg')
                    ),
                  )
              ),
              Text('Not bad',style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold))]        
            ),
            
            SizedBox(height:20),
            
            Text('Not bad you get a B'),
            SizedBox(height:35),
            ElevatedButton(
              onPressed: (){gradeController1.updateGrade('B'.obs); Get.back();}, 
              child: Text('Back'))
            ],

            
            
          )
        );
    }
}