import 'package:flutter/material.dart';
import 'package:iknoweverything/controller/gradeController.dart';
import 'package:get/get.dart';


class gradePageC extends StatelessWidget{
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
              Text('GG nah hah!',style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold))]        
            ),
            
            SizedBox(height:20),
            Text('GG nah hah, you get a C'),
            SizedBox(height:35),
            ElevatedButton(onPressed: (){gradeController1.updateGrade('C'.obs);Get.back();}, child: Text('Back'))
            ],

            
            
          )
        );
    }
}