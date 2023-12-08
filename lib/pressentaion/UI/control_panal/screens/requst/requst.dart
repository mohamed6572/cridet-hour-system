
import 'package:cridet_hour_system/pressentaion/UI/control_panal/screens/requst/requst_page/requst_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/cubit/cubit.dart';
import '../../../../../app/cubit/state.dart';
import '../../../../../generated/assets.dart';
import '../../../../resources/Lists_manager.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/constants_manager.dart';
import '../../../../resources/custom_widgets/custom_widget.dart';

class REQUST extends StatefulWidget {
  const REQUST({Key? key}) : super(key: key);

  @override
  _REQUSTState createState() => _REQUSTState();
}

class _REQUSTState extends State<REQUST> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(bottom: 25),
          height: double.infinity,
          color: ColorManager.backGround,
          child: Column(
            children: [
              squad_appBar(context,'الطلبات'),
              SizedBox(height: 20,),

              Expanded(child: ListView.builder(itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    AppConstants.navigateTo(context, RequstPage());

                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
                        child: Row(
                          mainAxisAlignment:  MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 30),
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                    image: AssetImage(Assets.imagesMe)
                                  )
                              ),

                            ),
                            Text('محمد هاني',style: Theme.of(context).textTheme.bodyLarge,),


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

        );
      },
    );
  }
}
