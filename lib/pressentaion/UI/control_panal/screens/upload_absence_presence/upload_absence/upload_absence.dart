import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/cubit/cubit.dart';
import '../../../../../../app/cubit/state.dart';
import '../../../../../resources/color_manager.dart';
import '../../../../../resources/constants_manager.dart';


class UploadAbsence extends StatefulWidget {
  UploadAbsence({required this.index, required this.title});
  int index;
  String title;
  @override
  _UploadAbsenceState createState() => _UploadAbsenceState();
}

class _UploadAbsenceState extends State<UploadAbsence> {
  List<List<dynamic>> excelData = [];

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (result != null) {
      String? filePath = result.files.single.path;
      if (filePath != null)
      {
        var excel = Excel.decodeBytes(await File(filePath).readAsBytes());

        for (var table in excel.tables.keys) {
          print(table); //sheet Name
          print(excel.tables[table]!.maxColumns);
          print(excel.tables[table]!.maxRows);
          print(excel.tables[table]!.rows.length);
          excelData = [];
          for (var row in excel.tables[table]!.rows) {
            excelData.add(row);
          }
        }

        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppConstants.defult_appBar(title: widget.title,context: context),
      body: Container(
        padding: EdgeInsets.only(bottom: 25),
        height: double.infinity,
        color: ColorManager.backGround,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (excelData.isNotEmpty)
                DataTable
                  (
                  columns: excelData[0]
                      .map((cell) => DataColumn(label: Text(cell.toString().substring(5,8)=='N/A' ? 'N/A' :cell.toString().substring(5,15))))
                      .toList(),
                  rows: excelData
                      .sublist(1)
                      .map(
                        (row) => DataRow(
                      cells: row
                          .map(
                            (cell) {
                              List<String> splitByParentheses = cell.toString().split("(");

                              // Extract the content within the parentheses
                              String dataContent = splitByParentheses[1].split(")")[0];

                              // Split the content by ","
                              List<String> splitByComma = dataContent.split(",");

                              // Trim each element to remove leading and trailing whitespaces
                              List<String> cleanedData = splitByComma.map((element) => element.trim()).toList();

                              List<List<String>> newData = [];
                              List<String> cellN = [];

                              for (int i = 0; i < cleanedData.length-1; i += 3) {
                                // Extract every three elements as a group
                                List<String> group = cleanedData.sublist(i, i + 3);

                                // Add the group to the new list
                                newData.add(group);
                              }

                              // Print the result
                              newData.forEach((group) {
                                print(group[0]);
                                cellN.add(group[0]);
                              });

                              return DataCell(cellN[0] == 'true' || cellN[0] =='false' ? Checkbox(value: cellN[0] == 'true' ? true : false, onChanged: (v){},fillColor: MaterialStateProperty.all( cellN[0] =='true' ?ColorManager.primary:Colors.red)) :Text(cellN[0]));
                            }
                      )
                          .toList(),
                    ),
                  )
                      .toList(),
                ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: _pickFile,
                child: Text('رفع ملفات الغياب والحضور'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class hdor{
  String subName = '';
  List<String> bol =[];
  List<String> date=[];
}