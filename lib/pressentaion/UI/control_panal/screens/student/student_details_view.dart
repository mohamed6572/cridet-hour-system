import 'package:cridet_hour_system/app/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../../app/cubit/cubit.dart';
import '../../../../../generated/assets.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/constants_manager.dart';
import '../../../../resources/custom_widgets/custom_widget.dart';

class StudentDetailsView extends StatefulWidget {
  const StudentDetailsView({Key? key}) : super(key: key);

  @override
  _StudentDetailsViewState createState() => _StudentDetailsViewState();
}

class _StudentDetailsViewState extends State<StudentDetailsView> {
  bool isChecked =true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            padding: EdgeInsets.only(bottom: 25),
            margin: EdgeInsets.symmetric(horizontal: 25),
            height: double.infinity,
            width: double.infinity,
            color: ColorManager.backGround,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  defult_container(
                      h: 160.0,
                      mh: 20.0,
                      ph: 20.0,
                      pv: 20.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(60)),
                            child: Image.asset(Assets.imagesMe,fit: BoxFit.contain),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('محمد هاني عبدالرؤف المغازي'),
                          Spacer(),
                          defult_button(
                              text: 'البيانات',
                              context: context,
                              color: AppConstants.controlPanal_photoOrdata
                                  ? ColorManager.grey
                                  : ColorManager.primary,
                              tcolor: ColorManager.white,
                              h: 50.0,
                              w: 120.0,
                              B: 12.0,
                              onTap: () {
                                cubit.photoORdata(false);
                              }),
                          SizedBox(
                            width: 20,
                          ),
                          defult_button(
                              text: 'الصور المدرجة',
                              context: context,
                              color: AppConstants.controlPanal_photoOrdata
                                  ? ColorManager.primary
                                  : ColorManager.grey,
                              tcolor: ColorManager.white,
                              h: 50.0,
                              w: 150.0,
                              B: 12.0,
                              onTap: () {
                                cubit.photoORdata(true);
                              }),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(left: 20),
                        height: mediaquery(context).height * .72,
                        width: double.infinity,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return defult_container(
                              child: Row(
                                children: [
                                  Icon(Icons.abc),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('data ')
                                ],
                              ),
                              w: double.infinity,
                              ph: 20.0,
                              pv: 10.0,
                              mh: 10.0,
                              mv: 10.0,
                            );
                          },
                        ),
                      )),
                      Expanded(
                          child: Container(
                        width: double.infinity,
                        height: mediaquery(context).height * .72,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  progres_widget(
                                    text: 'GPA',
                                    value: 70.0,
                                  ),
                                  progres_widget(
                                      text: 'نسبة الحضور',
                                      value: 70.0,
                                      onTap: () {}),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                def_button_Widget(text: 'المواد',icon: Icons.book_outlined,onTap: (){},color:ColorManager.primary),
                                def_button_Widget(text: 'الانذارات',icon: Icons.warning_amber_outlined,onTap: (){},color:ColorManager.error),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [  Text(
                                  'التربيه العسكرية',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isChecked = !isChecked;
                                      });
                                    },
                                    child: Container(
                                      width: 100, // Set the width to customize the size
                                      height: 100, // Set the height to customize the size
                                      child: Center(
                                        child: Transform.scale(
                                          scale: 2.0, // Set the scale factor to adjust the size
                                          child: Checkbox(
                                            value: isChecked,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget progres_widget({required double value, text, onTap}) =>
      defult_container(
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                Container(
                  height: 230,
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
                              style: TextStyle(fontSize: 30),
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

  Widget def_button_Widget({text , onTap , icon,color}) => InkWell(
        onTap: onTap,
        child: defult_container(
            child: Column(
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '$text',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            w: mediaquery(context).width / 4.5,
            mv: 20.0,
            pv: 20.0),
      );
}
