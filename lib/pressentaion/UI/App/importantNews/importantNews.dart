import 'package:cridet_hour_system/app/cubit/cubit.dart';
import 'package:cridet_hour_system/app/cubit/state.dart';
import 'package:cridet_hour_system/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';

import '../../../resources/custom_widgets/custom_widget.dart';

class ImportantNews_Screenn extends StatelessWidget {
  const ImportantNews_Screenn({Key? key}) : super(key: key);

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

              },
              child: defult_container(


                  child: Column(
                    children: [
                      Image.asset(Assets.imagesMe,height: 150,),
                      SizedBox(height: 20,),
                      Text('party',style: Theme.of(context).textTheme.bodyMedium,)
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
