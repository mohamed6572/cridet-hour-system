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

  @override
  Widget build(BuildContext context) {
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
                    child: Text('MAX :  ${allChosen.length}'),
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
                            chosed.add(subject);
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
                      cubit.Update_Subjects(
                          uid: cubit.student_model?.id,
                          /// to change the student list
                         // sub: cubit.firstGrade_subjects
                          sub: chosed
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
