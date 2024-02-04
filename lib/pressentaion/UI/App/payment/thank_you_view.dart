import 'package:cridet_hour_system/pressentaion/UI/App/payment/widgets/thank_you_view_body.dart';
import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar:AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark
        ),
        leading: Center(
          child: InkWell(

onTap: (){
  Navigator.pop(context);
},            child: SvgPicture.asset('assets/icons/arrow_back.svg',
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,


      ),
      body: Transform.translate(
        offset: Offset(0,-16),
          child: ThankYouViewBody()),
    );
  }
}
