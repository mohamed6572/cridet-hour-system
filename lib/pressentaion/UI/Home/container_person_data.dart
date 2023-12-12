import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:flutter/material.dart';

class ContainerPersonData extends StatelessWidget {
  String text;
  String text1;
  ContainerPersonData({required this.text,required this.text1});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 9,horizontal: 5),
      child: Row(
        children: [
          Text(text1,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: ColorManager.black)),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              text,
             style:Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),textAlign:TextAlign.start,
            ),
          )
        ],
      ),
    );
  }
}
