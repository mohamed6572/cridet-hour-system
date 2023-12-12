import 'package:cridet_hour_system/app/cubit/cubit.dart';
import 'package:cridet_hour_system/app/cubit/state.dart';
import 'package:cridet_hour_system/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/custom_widgets/custom_widget.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(builder: (context, state) {
      return Scaffold(
        appBar: app_AppBar(context),
         body: Column(
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
                       imageProvider: AssetImage(Assets.imagesMe,),
                     ),
                   ),
                 );
               },
               child: defult_container(


                   child:  Stack(
                     children: [
                       Center(
                           child: Image.asset(
                             Assets.imagesMe,
                             height: 200,
                           )),
                       Align(
                         alignment: Alignment.topLeft,
                         child: Row(
                           children: [
                             InkWell(
                               onTap:(){},
                               child: Container(
                                 height: 40,
                                 width: 40,
                                 decoration: BoxDecoration(
                                     color: ColorManager.primary,
                                     shape: BoxShape.circle),
                                 child: Icon(Icons.download_outlined,color: ColorManager.white,size: 24,),
                               ),
                             ),
                           ],
                         ),
                       )
                     ],
                   ),pv: 10.0),
             )
           ],
         ),
      );
    }, listener: (context, state) {

    },);
  }
}
