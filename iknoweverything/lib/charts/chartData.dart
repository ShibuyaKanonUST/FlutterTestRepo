import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:iknoweverything/charts/gradeChart.dart';
import 'package:iknoweverything/charts/gradePieChart.dart';

List<String> grade = ['A','B','C','D','F'];
List<int> year = [1,2,3,4];
List<int> distribution = [5, 45, 25, 7, 3];

final List<OrdinalSales>data = [];

List<OrdinalSales> addData(){
  for (int i=0; i<5; i++)
    data.add(new OrdinalSales(grade[i], distribution[i]));
  return data;
}