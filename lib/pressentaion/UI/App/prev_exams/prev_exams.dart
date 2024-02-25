import 'package:buildcondition/buildcondition.dart';
import 'package:cridet_hour_system/app/cubit/cubit.dart';
import 'package:cridet_hour_system/app/cubit/state.dart';
import 'package:cridet_hour_system/generated/assets.dart';
import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';

import '../../../resources/custom_widgets/custom_widget.dart';

class Prev_Exmas_Screen extends StatefulWidget {
  const Prev_Exmas_Screen({Key? key}) : super(key: key);

  @override
  State<Prev_Exmas_Screen> createState() => _Prev_Exmas_ScreenState();
}

class _Prev_Exmas_ScreenState extends State<Prev_Exmas_Screen> {
  Future<void> _refreshData(BuildContext context) async {
    final cubit = AppCubit.get(context);

    cubit.Get_LastExam_Images(context: context, grade: cubit.student_model!.levelar);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppCubit.get(context).Get_LastExam_Images(context: context, grade: AppCubit.get(context).student_model!.levelar);
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(builder: (context, state) {
      var cubit = AppCubit.get(context);
      return Scaffold(
          appBar: app_AppBar(context:context , text: 'Previous Exams' ),
          body: RefreshIndicator(
              color: ColorManager.primary,
              onRefresh: () => _refreshData(context),child : BuildCondition(
            fallback: (context) => Center(child: state is Get_Last_Exam_LoadingState ? CircularProgressIndicator() : Text('لايوجد صور بعد'),),
            condition:cubit.last_examImages.isNotEmpty,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(bottom:18.0),
                child: ListView.builder(
                  itemCount: cubit.last_examImages.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(height: 20,),
                        InkWell(
                          onTap: (){
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) => Dialog(
                                child: PhotoView(
                                  initialScale: PhotoViewComputedScale.contained * 0.9,
                                  imageProvider: NetworkImage(cubit.last_examImages[index].url!,),
                                ),
                              ),
                            );
                          },
                          child: defult_container(


                              child:  Stack(
                                children: [
                                  Center(
                                      child: Image.network(
                                        cubit.last_examImages[index].url!,
                                        height: 200,
                                      )),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap:(){
                                            cubit.download_Image(context: context,imageUrl: cubit.last_examImages[index].url!);
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: ColorManager.primary,
                                                shape: BoxShape.circle),
                                            child:state is Download_Image_LodingState ? Center(child: CircularProgressIndicator(color: ColorManager.white),) : Icon(Icons.download_outlined,color: ColorManager.white,size: 24,),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),pv: 10.0),

                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  },

                ),
              );
            },
          ))
      );
    }, listener: (context, state) {

    },);
  }
}
