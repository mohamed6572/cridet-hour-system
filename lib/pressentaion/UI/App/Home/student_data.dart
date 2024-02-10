import 'package:cached_network_image/cached_network_image.dart';
import 'package:cridet_hour_system/app/cubit/cubit.dart';
import 'package:cridet_hour_system/app/cubit/state.dart';
import 'package:cridet_hour_system/pressentaion/UI/Absence/absence_presence.dart';
import 'package:cridet_hour_system/pressentaion/resources/constants_manager.dart';
import 'package:cridet_hour_system/pressentaion/resources/custom_widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../generated/assets.dart';
import '../../../resources/color_manager.dart';
import 'container_person_data.dart';


class Student_PersonalData extends StatefulWidget {
  const Student_PersonalData({super.key});

  @override
  State<Student_PersonalData> createState() => _Student_PersonalDataState();
}

class _Student_PersonalDataState extends State<Student_PersonalData> {
  Future<void> _refreshData(BuildContext context) async {
    AppCubit.get(context).getUserData();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit  =AppCubit.get(context);
    return Scaffold(
      appBar: app_AppBar(context: context,text: 'Profile'),
      body: state is getUserLoadingState ?Center(child: CircularProgressIndicator(),):RefreshIndicator(
          color: ColorManager.primary,
          onRefresh: () => _refreshData(context),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(22),
                      width: MediaQuery.of(context).size.width * 3.0,
                      height: MediaQuery.of(context).size.height * 0.18,
                      decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 2,
                                spreadRadius: 1,
                                color: ColorManager.boxShadowColor)
                          ]),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(

                              imageUrl: "${cubit.student_model!.image}",
                                                  placeholder: (context, url) => CircularProgressIndicator(),
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,

                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text("${cubit.student_model!.name}",
                                      style: Theme.of(context).textTheme.bodyMedium),
                                ),
                                Center(
                                  child: Text("${cubit.student_model!.level}",
                                      style: Theme.of(context).textTheme.bodySmall),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(width: 10,),
                          // Icon(Icons.check_circle,color: ColorManager.green,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if(cubit.student_model!.gender =='Male')
                  Row(
                    children: [
                      Checkbox(value: cubit.student_model!.military, onChanged: (v) {}),
                      Text(
                        "Military Education",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: progres_widget(
                          text: 'GPA',
                          value: cubit.student_model!.gpa!,
                        ),
                      ),
                         Expanded(
                          child: progres_widget(
                            onTap:(){
                              print('object');
                                AppConstants.navigateTo(context,absence_presence());
                            } ,
                            text: 'Absence',
                            value: 70.0,
                          ),
                      ),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding:EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(1,3),
                                blurRadius: 2,
                                spreadRadius: 1,
                                color: ColorManager.boxShadowColor)
                          ],
                          color:ColorManager.white),
                    child: Column(
                      children: [
                        ContainerPersonData(
                          text: "${cubit.student_model!.id}",
                          text1: "ID:",
                        ),ContainerPersonData(
                          text: "${cubit.student_model!.password}",
                          text1: "password:",
                        ),
                        ContainerPersonData(
                          text: "${cubit.student_model!.phone}",
                          text1: "phone:",
                        ),
                        ContainerPersonData(
                          text: "${cubit.student_model!.email}",
                          text1: "email:",
                        ),


                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  },
);
  }

  Widget progres_widget({required double value, text, onTap}) =>
      defult_container(
          child: InkWell(
            onTap:onTap,
            child: Column(
              children: [
                Container(
                  height: 120,
                  padding: EdgeInsets.only(top: 10),
                  child: SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 0,
                      maximum: 100,
                      showLabels: false,
                      showTicks: false,
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.15,
                        cornerStyle: CornerStyle.bothCurve,
                        color: Color.fromARGB(30, 0, 169, 181),
                        thicknessUnit: GaugeSizeUnit.factor,
                      ),
                      annotations: [
                        GaugeAnnotation(
                            positionFactor: 0.15,
                            angle: 80,
                            widget: Text(
                              ' ${value} %',
                              style: Theme.of(context).textTheme.bodySmall,
                            ))
                      ],
                      pointers: <GaugePointer>[
                        RangePointer(
                          value: value,
                          color: ColorManager.primary,
                          cornerStyle: CornerStyle.bothCurve,
                          width: 0.15,
                          sizeUnit: GaugeSizeUnit.factor,
                        )
                      ],
                    ),
                  ]),
                ),
                Text('$text'),
                SizedBox(
                  height: 20,
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
          w: mediaquery(context).width / 4.5,
          mv: 10.0);
}
