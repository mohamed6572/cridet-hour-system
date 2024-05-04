import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../app/cubit/cubit.dart';
import '../../resources/custom_widgets/custom_widget.dart';
import '../../resources/models/absesnse/absesnse_model.dart';

class absence_presence extends StatefulWidget {
  @override
  State<absence_presence> createState() => _absence_presenceState();
}

class _absence_presenceState extends State<absence_presence> {
  List<DataColumn> dateList = [];
  var averageRate;

  List<Absennse_Model> filteredList = [];
  @override
  void initState() {
    dateList = [];
    // TODO: implement initState
    super.initState();
    var totalRate = 0.0;
    print(
        'filter ed => ${AppCubit.get(context).absennse_model.where((Absennse_Model element) => element.name == AppCubit.get(context).student_model?.name).toList()}');
    filteredList.addAll(AppCubit.get(context)
        .absennse_model
        .where((Absennse_Model element) =>
    element.name?.toLowerCase() == AppCubit.get(context).student_model?.name?.toLowerCase())
        .toList());
    if (filteredList != null) {
      for (var item in filteredList) {
        var tfList = item.list_t;
        var totalTrue = tfList?.where((element) => element == 'true').length;
        var rate = totalTrue! / tfList!.length;
        totalRate += rate;
      }
      averageRate = ((totalRate / filteredList.length) * 100).roundToDouble();
      print('Average rate of occurrence of "true" values: $averageRate');
      AppCubit.get(context).absennse_model[0].date!.forEach((element) {
        print(element);
        print('object');
        if (element != 'N/A')
          dateList.add(DataColumn(
              label: Text(
                  '${DateTime.parse(element.toString()).month}/${DateTime.parse(element.toString()).day}')));
        print(dateList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Absence",
                style:
                    Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 25),
              ),
            ),
            body:  Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width:160,
      
                            height: mediaquery(context).height-50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Subjects',style: Theme.of(context).textTheme.bodySmall,),
                                Divider(

                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: filteredList.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 9.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text('${filteredList[index].uid}',style: Theme.of(context).textTheme.bodySmall,),

                                            Divider(
height: 10,
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: DataTable(
                              border: TableBorder.all(),
      
                            headingRowHeight: 25,
        columnSpacing: 12,
                              columns: dateList,
                              rows: filteredList
                                  .map<DataRow>((e) => DataRow(
                                  cells: e.list_t!
                                      .map<DataCell>(
                                          (el) => DataCell(Container(
                                        width:22,
                                        child: Checkbox(
                                          fillColor:
                                          MaterialStateProperty.all(
                                              el.toString() ==
                                                  'true'
                                                  ? ColorManager
                                                  .primary
                                                  : Colors.red),
                                          value: el.toString() ==
                                              'true',
                                          onChanged: (value) {},
                                        ),
                                      )))
                                      .toList()))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  Text(
                    'Total : ${averageRate}',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
