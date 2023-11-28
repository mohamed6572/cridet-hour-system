import 'package:cridet_hour_system/app/cubit/cubit.dart';
import 'package:cridet_hour_system/app/cubit/state.dart';
import 'package:cridet_hour_system/generated/assets.dart';
import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ControlPanal extends StatefulWidget {
  const ControlPanal({Key? key}) : super(key: key);

  @override
  _ControlPanalState createState() => _ControlPanalState();
}

class _ControlPanalState extends State<ControlPanal> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(builder: (context,dynamic){
      return Scaffold(
        body: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width/3.7,
              height: double.infinity,
              color: ColorManager.primary,
              child: Column(
                children: [
                  SizedBox(height: 50,
                  ),
                  Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(130),
                      color: ColorManager.white
                    ),
                    child:  Image.asset(Assets.Logo,height: MediaQuery.of(context).size.height/4,),
                  )

                ],
              ),
            ),
            Expanded(child: Container(height: double.infinity,color: ColorManager.blueDark,))
          ],
        ),
      )
      ;
    }, listener: (context,dynamic){});
  }
}
