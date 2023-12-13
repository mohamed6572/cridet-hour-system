import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:flutter/material.dart';

class absence_presence extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "HIMIT",
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 25),
          ),
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SafeArea(
                child: DataTable(
                  showBottomBorder: true,
                  border: TableBorder(
                    verticalInside:
                        BorderSide(color: ColorManager.primary, width: 0.7),
                  ),
                  columns: [
                    DataColumn(
                      label: Text(
                        "Subjects",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    DataColumn(
                      label: Text('2/1'),
                    ),
                    DataColumn(
                      label: Text('3/1'),
                    ),
                    DataColumn(
                      label: Text('4/1'),
                    ),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text(
                        "SoftwareEngineering",
                        style: Theme.of(context).textTheme.bodySmall,
                      )),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        "SoftwareEngineering",
                        style: Theme.of(context).textTheme.bodySmall,
                      )),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        "SoftwareEngineering",
                        style: Theme.of(context).textTheme.bodySmall,
                      )),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        "SoftwareEngineering",
                        style: Theme.of(context).textTheme.bodySmall,
                      )),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        "SoftwareEngineering",
                        style: Theme.of(context).textTheme.bodySmall,
                      )),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        "SoftwareEngineering",
                        style: Theme.of(context).textTheme.bodySmall,
                      )),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        "SoftwareEngineering",
                        style: Theme.of(context).textTheme.bodySmall,
                      )),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        "SoftwareEngineering",
                        style: Theme.of(context).textTheme.bodySmall,
                      )),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        "SoftwareEngineering",
                        style: Theme.of(context).textTheme.bodySmall,
                      )),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                      DataCell(Checkbox(value: true, onChanged: (value) {})),
                    ]),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 25),
                  ),
                  Text("10",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 25)),
                ],
              ),
            )
          ],
        ));
  }
}
