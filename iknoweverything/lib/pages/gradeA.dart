import 'package:flutter/material.dart';
import 'package:iknoweverything/controller/gradeController.dart';
import 'package:get/get.dart';


class gradePageA extends StatelessWidget{
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
                    image: NetworkImage('images/de50d7af59a21e04e31cd0b82d40f80a.jpg')
                    ),
                  )
              ),
              Text('Congratulations!',style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold))]        
            ),
            
            SizedBox(height:20),
            Text('Congratulations you get an A'),
            SizedBox(height:35),
            ElevatedButton(onPressed: (){gradeController1.updateGrade('A'.obs);Get.back();}, child: Text('Back'))
            ],

            
            
          )
        );
    }
}