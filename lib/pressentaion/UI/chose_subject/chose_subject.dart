import 'package:cridet_hour_system/app/cubit/cubit.dart';
import 'package:cridet_hour_system/app/cubit/state.dart';
import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:cridet_hour_system/pressentaion/resources/constants_manager.dart';
import 'package:cridet_hour_system/pressentaion/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/models/subject_model/subject_model.dart';
import '../App/payment/payments_details.dart';

class ChoseSubject_Screen extends StatefulWidget {
  const ChoseSubject_Screen({super.key});

  @override
  State<ChoseSubject_Screen> createState() => _ChoseSubject_ScreenState();
}

class _ChoseSubject_ScreenState extends State<ChoseSubject_Screen> {
  List<Subject_Model> allChosen = [];
  List<Subject_Model> chosed = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppCubit.get(context).all_subjects.forEach((element) {
      print('chose');
      AppCubit.get(context).student_model?.last_subject?.forEach((element1) {
        print('chose1');
        if (element1['code'] == element.needs) {
          allChosen.add(element);
          print('chose2');
        }
      });
    });
  }
  String num_subject(double x) {
    if (x >= 3)
      return '7';
    if (2 <= x && x < 3)
      return '6';
    if (1 < x && x < 2)
      return '5';
    if (x < 1)
      return '4';
    return '';
  }

  @override
  Widget build(BuildContext context) {
    var x = AppCubit.get(context).student_model!.gpa!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Chose New Subject',
          style: Styles.style20.copyWith(color: Colors.white),
        ),
      ),
      body: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          if(state is UpdateSubject_SuccsesState){
            AppConstants.navigateToAndFinish(context, PaymentsDetailsView());
          }
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Your GPA : ${cubit.student_model?.gpa}'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Avilable Subject : ${allChosen.length} , '),
                    Text('Chosed : ${chosed.length}'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text('MIN : 5'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text('MAX :  ${num_subject(x)}'),
                  ),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: allChosen.length,
                  itemBuilder: (context, index) {
                    final subject = allChosen[index];
                    final isChosen = chosed.contains(subject);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isChosen) {
                            chosed.remove(subject);
                          } else {
                            if (chosed.length < int.parse(num_subject(x))) {
                              chosed.add(subject);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  duration: Duration(
                                      milliseconds: 400
                                  ),
                                  backgroundColor: Colors.red,
                                  content: Text("You cannot choose more than ${num_subject(x)} subjects."),
                                ),
                              );
                            }
                          }
                        });
                      },

                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: ColorManager.primary),
                                  color: isChosen
                                      ? ColorManager.primary
                                      : Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Text(
                                subject.nameSubject ?? '',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 70,
                width: double.infinity,
                color: Colors.white,
                child: TextButton(
                  onPressed: () {
                 if(chosed.isNotEmpty)  {
                  if(chosed.length  >=4) {
                    cubit.Update_Subjects(
                        uid: cubit.student_model?.id,

                        /// to change the student list
                        // sub: cubit.firstGrade_subjects
                        sub: chosed);
                  }

                  else{

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(
                                milliseconds: 400
                            ),
                            backgroundColor: Colors.red,
                            content: Text("Min Subjects 5 ."),
                          ),
                        );
                      }
                    }  else{

                   ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(
                       duration: Duration(
                         milliseconds: 400
                       ),
                       backgroundColor: Colors.red,
                       content: Text("Min Subjects 5 ."),
                     ),
                   );
                 }
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
