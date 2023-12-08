
import 'package:cridet_hour_system/pressentaion/UI/control_panal/screens/upload_absence_presence/upload_absence/upload_absence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/cubit/cubit.dart';
import '../../../../../app/cubit/state.dart';
import '../../../../resources/Lists_manager.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/constants_manager.dart';
import '../../../../resources/custom_widgets/custom_widget.dart';

class Upload_AbsencePresence extends StatefulWidget {
  @override
  _Upload_AbsencePresenceState createState() => _Upload_AbsencePresenceState();
}
class _Upload_AbsencePresenceState extends State<Upload_AbsencePresence> {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
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
                AppConstants.navigateTo(context,  UploadAbsence(index: index,title: Lists_Manager.YearText[index]),);
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
