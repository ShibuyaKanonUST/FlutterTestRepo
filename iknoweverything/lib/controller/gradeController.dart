import 'package:get/get.dart';

class GradeCotroller extends GetxController{
  var grade = 'A'.obs;
  void updateGrade(var g){
    grade = g;
  }

}