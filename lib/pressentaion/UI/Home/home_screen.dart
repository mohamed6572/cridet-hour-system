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
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: Text("nada jamal\nLevel Four",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium),
                        ),
                      )
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

                        icon: Icon(Icons.padding),
                        onTap: (){
                          AppConstants.navigateTo(context, Student_PersonalData());

                        },
                        text: ("Personal\nData"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      container(
                        onTap: (){

                        },
                        icon: Icon(Icons.backup_table_outlined),
                        text: ("Schedule"),

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
                        icon: Icon(Icons.video_collection),
                        text: ("Section\nLink"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      container(
                        onTap: (){

                        },
                        text: ("Lectures\nLink"),
                        icon: Icon(Icons.video_collection),
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
                        icon: Icon(Icons.dnd_forwardslash_outlined),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      container(
                        onTap: (){

                        },
                        icon: Icon(Icons.group_sharp),
                        text: ("Military\n Education"),
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
                        text: ("Gpa"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      container(
                        onTap: (){

                        },
                        icon: Icon(Icons.check_box),
                        text: ("Attendance\nTracking"),
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
                        text: ("courses"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      container(
                        onTap: (){

                        },
                        icon: Icon(Icons.padding),
                        text: ("Previous\nExaminations"),
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
                        text: ("Midterm\nExaminations"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      container(
                        onTap: (){

                        },
                        icon: Icon(Icons.padding),
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
                        icon: Icon(Icons.mail),
                        text: ("Institute\nMail"),
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
