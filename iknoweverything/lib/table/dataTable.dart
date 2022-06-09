import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iknoweverything/charts/chartData.dart';

/// Example without a datasource
class DataTable2SimpleDemo extends StatelessWidget {
  const DataTable2SimpleDemo();

  List<DataCell> generateDataCell(List args, int index) {
    List<DataCell> datacell = [];
    for (int j = 0; j < 5; j++) 
        datacell.add(DataCell(Center(child:Text(args[j][index].toString(),textAlign:TextAlign.center))));

    return datacell;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          columns: [
            DataColumn2(
              label: Center(child:Text('Name',textAlign:TextAlign.center)),
              size: ColumnSize.L,
            ),
            DataColumn(
              label: Center(child:Text('Year',textAlign:TextAlign.center)),
            ),
            DataColumn(
              label: Center(child:Text('GPA',textAlign:TextAlign.center)),
            ),
            DataColumn(
              label: Center(child:Text('COMP2211 Grade',textAlign:TextAlign.center)),
            ),
            DataColumn(
              label: Center(child:Text('Final exam score',textAlign:TextAlign.center)),
              numeric: true,
            ),
          ],
          rows: List<DataRow>.generate(
              5,
              (index) => DataRow(
                  cells: generateDataCell(
                      [supervisor, year, gpa, grade, distribution], index)))),
    );
  }
}
