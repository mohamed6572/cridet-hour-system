import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/cubit/cubit.dart';
import '../../../../../app/cubit/state.dart';
import '../../../../resources/Lists_manager.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/constants_manager.dart';
import '../../../../resources/custom_widgets/custom_widget.dart';
import '../student/student_absence/student_absence.dart';

class MidleExams extends StatefulWidget {
  const MidleExams({Key? key}) : super(key: key);

  @override
  _MidleExamsState createState() => _MidleExamsState();
}

class _MidleExamsState extends State<MidleExams> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(bottom: 25),
          height: double.infinity,
          color: ColorManager.backGround,
          child: Column(
            children: [
              squad_appBar(context,'الفرق'),
              SizedBox(height: 20,),
              Expanded(child: ListView.builder(itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    AppConstants.navigateTo(context,  StudentAbsence(index: index,title: Lists_Manager.YearText[index]),);
                  },
                  child: squad_body(index),
                );

              },itemCount: 4,)),
            ],
          ),

        );
      },
    );
  }
}
