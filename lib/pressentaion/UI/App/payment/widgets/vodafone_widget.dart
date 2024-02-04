import 'package:cridet_hour_system/pressentaion/resources/constants_manager.dart';
import 'package:flutter/material.dart';

class VodafoneWidget extends StatelessWidget {
  const VodafoneWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Phone Number'),
          SizedBox(height: 10,),
          TextField(
            keyboardType: TextInputType.phone,
            style: TextStyle(
              fontSize: 16
            ),
          )

        ],
      ),
    );
  }
}
