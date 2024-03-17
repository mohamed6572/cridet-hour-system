import 'package:cridet_hour_system/app/cubit/state.dart';
import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/cubit/cubit.dart';
import '../../resources/custom_widgets/custom_widget.dart';
import '../../resources/models/absesnse/absesnse_model.dart';

class GPA_Screen extends StatefulWidget {
  
  @override
  State<GPA_Screen> createState() => _GPA_ScreenState();
}

class _GPA_ScreenState extends State<GPA_Screen> {
  


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit  , AppState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = AppCubit.get(context);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "GPA",
              style:
              Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 25),
            ),
          ),
          body:  Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(

                    height: mediaquery(context).height-100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Subject Name',style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),),
                            Spacer(),
                            Text('Degree',style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Divider(

                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount:AppCubit.get(context).reuslts[0].grades!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 9.0),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text('${AppCubit.get(context).reuslts[0].grades?[index]['subject_name']}',style: Theme.of(context).textTheme.bodySmall,),
                                        Spacer(),
                                        Row(
                                          children: [
                                            Text('${AppCubit.get(context).reuslts[0].grades?[index]['grade']} / 100',style: Theme.of(context).textTheme.bodySmall,),

                                          ],
                                        ),
                                      ],
                                    ),

                                    Divider(
                                      height: 10,
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                Text(
                  'Total GPA : ${cubit.student_model?.gpa??cubit.totalGPA}',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )),
    );
  },
);
  }
}
