import 'package:cridet_hour_system/generated/assets.dart';
import 'package:cridet_hour_system/pressentaion/UI/Home/component/container.dart';
import 'package:cridet_hour_system/pressentaion/UI/Home/student_data.dart';
import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:cridet_hour_system/pressentaion/resources/constants_manager.dart';
import 'package:cridet_hour_system/pressentaion/resources/custom_widgets/custom_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Padding(
        //   padding: EdgeInsets.only(bottom:10,left:10),
        //   // child: ClipRRect(
        //   //     borderRadius: BorderRadius.circular(20),
        //   //     child: Image.asset(
        //   //       Assets.iconsLogoWhite,
        //   //       color: Colors.white,
        //   //     )),
        // ),
        // leading:Center(child: CircleAvatar(child:Image.asset(Assets.Logo))),
        centerTitle: true,
        title: Text("HIMIT",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: ColorManager.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: InkWell(
                onTap: (){
                  AppConstants.navigateTo(context, Student_PersonalData());
                },
                child: Container(
                  margin: EdgeInsets.all(22),
                  padding: EdgeInsets.all(22),
                  width: MediaQuery.of(context).size.width * 3.0,
                  height: MediaQuery.of(context).size.height * 0.18,
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0,4),
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
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text("nada jamal",
                                  style: Theme.of(context).textTheme.bodyMedium),
                            ),
                            Center(
                              child: Text("Level Four",
                                  style: Theme.of(context).textTheme.bodySmall),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    children: [
                      container(
                        onTap: (){

                        },
                        icon: Icon(Icons.table_chart_outlined),
                        text: ("Schedule"),

                      ),
                    ],
                  ),
                  Column(
                    children: [
                      container(
                        onTap: (){
                          showDialog(context: context, builder:(context) => Dialog(
                            child:Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                height: mediaquery(context).height/3,

                                child: SingleChildScrollView(
                                  child:Column(
                                    children: [
                                      Icon(Icons.warning_amber,color: ColorManager.error,),
                                      SizedBox(height: 20,),
                                      Text("hello please go to check your properties",textAlign: TextAlign.center,),
                                    ],
                                  ),
                                ),
                              ),
                            ) ,
                          ),);
                        },
                        text: ("Warnings"),
                        icon: Icon(Icons.warning_amber),
                      ),
                    ],
                  ),
                ],
              ),
            ),



            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  Column(
                    children: [
                      container(
                        onTap: (){

                        },
                        icon: Icon(Icons.video_collection_outlined),
                        text: ("courses"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      container(
                        onTap: (){

                        },
                        icon: Icon(Icons.access_time_outlined),
                        text: ("Previous\nExaminations"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  Column(
                    children: [
                      container(
                        onTap: (){

                        },
                        icon: Icon(Icons.auto_stories_sharp),
                        text: ("Book\nList"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      container(
                        onTap: (){

                        },
                        icon: Icon(Icons.note_alt_outlined),
                        text: ("Midterm\nExaminations"),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    children: [
                      container(
                        onTap: (){

                        },
                        icon: Icon(Icons.home_repair_service_sharp),
                        text: ("Vacant\nPositions"),
                      ),
                    ],
                  )
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      container(
                        onTap: (){

                        },
                        icon: Icon(Icons.padding),
                        text: ("------"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      container(
                        onTap: (){

                        },
                        icon: Icon(Icons.padding),
                        text: ("-----"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
