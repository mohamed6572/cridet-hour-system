
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/cubit/cubit.dart';
import '../../../app/cubit/state.dart';
import '../../../generated/assets.dart';
import '../../resources/color_manager.dart';
import '../../resources/constants_manager.dart';

class ControlPanal extends StatefulWidget {
  const ControlPanal({Key? key}) : super(key: key);

  @override
  _ControlPanalState createState() => _ControlPanalState();
}

class _ControlPanalState extends State<ControlPanal> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        builder: (context, dynamic) {
          var cubit = AppCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: Row(
                children: [
                  Drawer(
                    shape: Border.all(
                      color: Colors.transparent
                    ),
                    width: MediaQuery.of(context).size.width / 5,
                    backgroundColor: ColorManager.primary,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Image.asset(Assets.imagesLogo,
                                height: MediaQuery.of(context).size.height / 4.7,
                                color: ColorManager.white),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ButtonWidget(
                            onTap: () {
                              cubit.changeControlPanal_Screens_Index(0);
                            },
                            text: 'الطلبات',
                            index: 0,
                            cubitindex: AppConstants.controlPanal_Screens_Index,
                          ),
                          ButtonWidget(
                            onTap: () {
                              cubit.changeControlPanal_Screens_Index(1);
                            },
                            text: 'الطلاب',
                            index: 1,
                            cubitindex: AppConstants.controlPanal_Screens_Index,
                          ),
                          ButtonWidget(
                              onTap: () {
                                print(MediaQuery.of(context).size);
                                cubit.changeControlPanal_Screens_Index(2);
                              },
                              cubitindex: AppConstants.controlPanal_Screens_Index,
                              text: 'الغياب والحضور',
                              index: 2),
                          ButtonWidget(
                              onTap: () {
                                print(MediaQuery.of(context).size);
                                cubit.changeControlPanal_Screens_Index(3);
                              },
                              cubitindex: AppConstants.controlPanal_Screens_Index,
                              text: 'المواد',
                              index: 3),


                          ButtonWidget(
                              onTap: () {
                                print(MediaQuery.of(context).size);
                                cubit.changeControlPanal_Screens_Index(4);
                              },
                              cubitindex: AppConstants.controlPanal_Screens_Index,
                              text: 'المحاضرات',
                              index: 4),
                          ButtonWidget(
                              onTap: () {
                                print(MediaQuery.of(context).size);
                                cubit.changeControlPanal_Screens_Index(5);
                              },
                              cubitindex: AppConstants.controlPanal_Screens_Index,
                              text: 'السكاشن',
                              index: 5),
                          ButtonWidget(
                              onTap: () {

                                print(MediaQuery.of(context).size);
                                cubit.changeControlPanal_Screens_Index(6);
                                print(AppConstants.controlPanal_Screens_Index);
                              },
                              cubitindex: AppConstants.controlPanal_Screens_Index,
                              text: 'الجداول',
                              index:6),
                          ButtonWidget(
                              onTap: () {
                                print(MediaQuery.of(context).size);
                                cubit.changeControlPanal_Screens_Index(7);
                              },
                              cubitindex: AppConstants.controlPanal_Screens_Index,
                              text: 'امتحانات الميد تيرم',
                              index: 7),
                          ButtonWidget(
                              onTap: () {
                                print(MediaQuery.of(context).size);
                                cubit.changeControlPanal_Screens_Index(8);
                                print(AppConstants.controlPanal_Screens_Index);
                              },
                              cubitindex: AppConstants.controlPanal_Screens_Index,
                              text: 'الامتحانات السابقة',
                              index: 8),
SizedBox(height: 40,)

                        ],
                      ),
                    ),
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width / 6,
                  //   height: double.infinity,
                  //   color: ColorManager.primary,
                  //   child: Column(
                  //     children: [
                  //       SizedBox(
                  //         height: 30,
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.all(10),
                  //         child: Image.asset(Assets.imagesLogo,
                  //             height: MediaQuery.of(context).size.height / 4.7,
                  //             color: ColorManager.white),
                  //       ),
                  //       SizedBox(
                  //         height: 30,
                  //       ),
                  //       ButtonWidget(
                  //         onTap: () {
                  //           cubit.changeControlPanal_Screens_Index(0);
                  //         },
                  //         text: 'الطلبات',
                  //         index: 0,
                  //         cubitindex: AppConstants.controlPanal_Screens_Index,
                  //       ),
                  //       ButtonWidget(
                  //         onTap: () {
                  //           cubit.changeControlPanal_Screens_Index(1);
                  //         },
                  //         text: 'الطلاب',
                  //         index: 1,
                  //         cubitindex: AppConstants.controlPanal_Screens_Index,
                  //       ),
                  //       ButtonWidget(
                  //           onTap: () {
                  //             print(MediaQuery.of(context).size);
                  //             cubit.changeControlPanal_Screens_Index(2);
                  //           },
                  //           cubitindex: AppConstants.controlPanal_Screens_Index,
                  //           text: 'الغياب والحضور',
                  //           index: 2),
                  //     ],
                  //   ),
                  // ),

                  Expanded(
                      child: cubit.controlPanal_Screens[
                      AppConstants.controlPanal_Screens_Index]),

                ],
              ),
            ),
          );
        },
        listener: (context, dynamic) {});
  }

  Widget ButtonWidget({
    text,
    onTap,
    index,
    cubitindex,
  }) =>
      InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: index == cubitindex ? ColorManager.darkGrey : ColorManager.white,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Center(
              child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color:  index == cubitindex ? ColorManager.white : ColorManager.black,fontSize:MediaQuery.of(context).size ==Size(1264.0, 681.0) ? 15 : 20),
          )),
        ),
      );
}
