import 'package:cridet_hour_system/pressentaion/UI/control_panal/screens/student/student_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/cubit/cubit.dart';
import '../../../../../app/cubit/state.dart';
import '../../../../../generated/assets.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/constants_manager.dart';
import '../../../../resources/custom_widgets/custom_widget.dart';

class StudentPageView extends StatefulWidget {
  StudentPageView({required this.index, required this.title});
  int index;
  String title;
  @override
  _StudentPageViewState createState() => _StudentPageViewState();
}

class _StudentPageViewState extends State<StudentPageView> {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar:AppConstants.defult_appBar(title: widget.title,context: context),
          body: Container(
            padding: EdgeInsets.only(bottom: 25),
            height: double.infinity,
            color: ColorManager.backGround,
            child: Column(
              children: [

                SizedBox(height: 10,),
                Expanded(child: ListView.builder(itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      AppConstants.navigateTo(context, StudentDetailsView());
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
                          child: Row(
                            mainAxisAlignment:  MainAxisAlignment.end,
                            children: [
                              Text('محمد هاني',style: Theme.of(context).textTheme.bodyLarge,),
                              Container(
                                margin: EdgeInsets.only(left: 30),
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),

                                ),
                                child: Image.asset(Assets.imagesMe,fit: BoxFit.contain),
                              ),

                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Divider(
                            thickness: 2,
                            height: 40,
                            color: ColorManager.black,
                          ),
                        )
                      ],
                    ),
                  );

                },itemCount: 4,)),
              ],
            ),

          ),
        );
      },
    );
  }
}
