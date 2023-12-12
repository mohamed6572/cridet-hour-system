import 'package:cridet_hour_system/app/cubit/cubit.dart';
import 'package:cridet_hour_system/app/cubit/state.dart';
import 'package:cridet_hour_system/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';

import '../../../resources/custom_widgets/custom_widget.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(builder: (context, state) {
      return Scaffold(
        appBar: app_AppBar(context),
        body: Column(
          children: [
            SizedBox(height: 20,),
            defult_container(


                child: Row(
                  children: [
                    Image.asset(Assets.imagesMe,height: 100,),
                    SizedBox(width: 20,),
                    Text('Physics')
                  ],
                ),pv: 10.0,ph: 15.0)
          ],
        ),
      );
    }, listener: (context, state) {

    },);
  }
}
