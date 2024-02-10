import 'package:buildcondition/buildcondition.dart';
import 'package:cridet_hour_system/app/cubit/cubit.dart';
import 'package:cridet_hour_system/app/cubit/state.dart';
import 'package:cridet_hour_system/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/custom_widgets/custom_widget.dart';

class ImportantNews_Screenn extends StatefulWidget {
  const ImportantNews_Screenn({Key? key}) : super(key: key);

  @override
  State<ImportantNews_Screenn> createState() => _ImportantNews_ScreennState();
}

class _ImportantNews_ScreennState extends State<ImportantNews_Screenn> {
  Future<void> _refreshData(BuildContext context) async {
    final cubit = AppCubit.get(context);

    cubit.GetImportantNewsImages(context: context, grade: cubit.student_model!.levelar);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppCubit.get(context).GetImportantNewsImages(context: context, grade: AppCubit.get(context).student_model!.levelar);
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(builder: (context, state) {
      var cubit = AppCubit.get(context);
      return Scaffold(
          appBar: app_AppBar(context:context , text: 'News' ),
          body:RefreshIndicator(
              color: ColorManager.primary,
              onRefresh: () => _refreshData(context),
              child: BuildCondition(
            fallback: (context) => Center(child: state is Get_ImportantNews_LoadingState ? CircularProgressIndicator() : Text('لايوجد صور بعد'),),
            condition:cubit.ImportantNewsImages.isNotEmpty,
            builder: (context) {
              return ListView.builder(
                itemCount: cubit.ImportantNewsImages.length,
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
                                imageProvider: NetworkImage(cubit.ImportantNewsImages[index].url!,),
                              ),
                            ),
                          );
                        },
                        child: defult_container(


                            child:  Stack(
                              children: [
                                Center(
                                    child: Image.network(
                                      cubit.ImportantNewsImages[index].url!,
                                      height: 200,
                                    )),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap:(){
                                          cubit.download_Image(context: context,imageUrl: cubit.ImportantNewsImages[index].url!);
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
                      )
                    ],
                  );
                },

              );
            },
          ))
      );
    }, listener: (context, state) {

    },);
  }
}
