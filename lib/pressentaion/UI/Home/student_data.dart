import 'package:cridet_hour_system/pressentaion/UI/Home/container_person_data.dart';
import 'package:cridet_hour_system/pressentaion/resources/custom_widgets/custom_widget.dart';
import 'package:flutter/material.dart';

import '../../../generated/assets.dart';
import '../../resources/color_manager.dart';

class Student_PersonalData extends StatefulWidget {
  const Student_PersonalData({super.key});

  @override
  State<Student_PersonalData> createState() => _Student_PersonalDataState();
}

class _Student_PersonalDataState extends State<Student_PersonalData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("HIMIT",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: ColorManager.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(22),
                  width: MediaQuery.of(context).size.width * 3.0,
                  height: MediaQuery.of(context).size.height * 0.18,
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 2,
                            spreadRadius: 1,
                            color: ColorManager.boxShadowColor)
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(Assets.nada),
                        maxRadius: 50,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: Text("nada jamal\nLevel Four",
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      ),
                      // SizedBox(width: 10,),
                      // Icon(Icons.check_circle,color: ColorManager.green,)
                    ],
                  ),
                ),
              ),
              SizedBox(height:20,),
              Row(
               children: [
                 Checkbox(value: true, onChanged: (v){}),
                 Text("Military Education",style:Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize:20) ,),
               ],
              ),
              Row(
                children: [
                  defult_container
                    (
                    pv: 5.0,
                    h: 140.0,
                      w: mediaquery(context).width/2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                    Text('3.0',style: Theme.of(context).textTheme.bodyLarge,),

                    Align(alignment: Alignment.bottomCenter,

                        child: Text('GPA',style: Theme.of(context).textTheme.bodyMedium,)),
                  ],))
                ],
              ),
              Row(
                children: [
                  Text(
                      "password:",
                      style:Theme.of(context).textTheme.bodySmall!.copyWith(color:ColorManager.black)
                  ),
                  SizedBox(width:10,),
                ContainerPersonData(text:"nadajamal123.@",)


                ],
              ),
              Row(
                children: [
                  Text(
                      "phone:",
                      style:Theme.of(context).textTheme.bodySmall!.copyWith(color:ColorManager.black)
                  ),
                  SizedBox(width:10,),
          ContainerPersonData(text:"01099340772",)

                ],
              ),
              Row(
                children: [
                  Text(
                      "email:",
                      style:Theme.of(context).textTheme.bodySmall!.copyWith(color:ColorManager.black)
                  ),
                  SizedBox(width:10,),
          ContainerPersonData(text:"nadajamal@gmail.com",)

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
