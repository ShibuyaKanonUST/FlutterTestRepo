import 'package:get/get.dart';

class GradeCotroller extends GetxController{
  RxString grade = 'X'.obs;
  void updateGrade(RxString g){
    grade = g;
    update();
  }

}