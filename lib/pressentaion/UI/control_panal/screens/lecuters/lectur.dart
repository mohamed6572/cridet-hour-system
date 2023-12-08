import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/cubit/cubit.dart';
import '../../../../../app/cubit/state.dart';
import '../../../../resources/Lists_manager.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/constants_manager.dart';
import '../../../../resources/custom_widgets/add_links.dart';
import '../../../../resources/custom_widgets/custom_widget.dart';

class Lectuer extends StatefulWidget {
  const Lectuer({Key? key}) : super(key: key);

  @override
  _LectuerState createState() => _LectuerState();
}

class _LectuerState extends State<Lectuer> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var  cubit = AppCubit.get(context);
        return Container(
          padding: EdgeInsets.only(bottom: 25),
          height: double.infinity,
          color: ColorManager.backGround,
          child: Column(
            children: [
              squad_appBar(context,'الفرق'),
              SizedBox(height: 20,),
              Expanded(child: ListView.builder(itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    AppConstants.navigateTo(context,  AddLinks(
                      list: cubit.lectuerLinkList,
                      index: index,
                      name: 'المحاضرات',
                    ),);
                  },
                  child: squad_body(index),
                );

              },itemCount: 4,)),
            ],
          ),

        );
      },
    );
  }
}
