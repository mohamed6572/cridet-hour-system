import 'package:buildcondition/buildcondition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cridet_hour_system/app/cubit/cubit.dart';
import 'package:cridet_hour_system/app/cubit/state.dart';
import 'package:cridet_hour_system/generated/assets.dart';
import 'package:cridet_hour_system/pressentaion/UI/App/Home/student_data.dart';
import 'package:cridet_hour_system/pressentaion/UI/App/courses/courses_screen.dart';
import 'package:cridet_hour_system/pressentaion/UI/App/midterm_screen/midterm_screen.dart';
import 'package:cridet_hour_system/pressentaion/UI/App/schedule/schedule_screen.dart';
import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:cridet_hour_system/pressentaion/resources/constants_manager.dart';
import 'package:cridet_hour_system/pressentaion/resources/custom_widgets/custom_widget.dart';
import 'package:cridet_hour_system/pressentaion/resources/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bookscreen/bookscreen.dart';
import '../importantNews/importantNews.dart';
import 'component/container.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppCubit.get(context).getUserData();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {

    var cubit  =AppCubit.get(context);

    return Scaffold(
      appBar:app_AppBar(context:context),
      drawer: Drawer(
        backgroundColor: ColorManager.primary,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "HIMIT",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: ColorManager.white),
                  ),
                  SizedBox(
                    height:MediaQuery.of(context).size.height*0.1,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: InkWell(
                      onTap:(){
                        print(AppCubit.get(context).student_model?.email);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "مصر،كفرالشيخ",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.location_on_outlined,
                            color: ColorManager.white,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: InkWell(
                      onTap:(){},
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "01099340772",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.call,
                            color: Colors.white,
                            size: 25,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: InkWell(
                      onTap:(){},
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "nadajamal@gmail.com",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.mail,
                            color: Colors.white,
                            size: 25,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height:200,),
                  Padding(
                    padding:EdgeInsets.all(12),
                    child: InkWell(
                      onTap:(){},
                      child:Row(
                        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.facebook_rounded,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.smart_display_rounded,
                            color: ColorManager.error,
                            size: 25,
                          ),
                          Icon(
                            Icons.chat,
                            color: ColorManager.white,
                            size: 25,
                          ),
                          Icon(
                            Icons.web,
                            color: ColorManager.white,
                            size: 25,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: BuildCondition(
        builder: (context) => SingleChildScrollView(
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CachedNetworkImage(

                            imageUrl: "${cubit.student_model!.image}",
                            placeholder: (context, url) => CircularProgressIndicator(),
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,

                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
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
                                child: Text("${cubit.student_model!.name}",
                                    style: Theme.of(context).textTheme.bodyMedium),
                              ),
                              Center(
                                child: Text("${cubit.student_model!.level}",
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
                            AppConstants.navigateTo(context, ScheduleScreen());

                          },
                          icon: Icon(Icons.table_chart_outlined),
                          text: ("Tables"),

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
                            AppConstants.navigateTo(context, CoursesScreen());
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
                            AppConstants.navigateTo(context, BookScreen());

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
                            AppConstants.navigateTo(context,Midterm_Exam());
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
                            AppConstants.navigateTo(context, ImportantNews_Screenn());

                          },
                          icon: Icon(Icons.home_repair_service_sharp),
                          text: ("Important\nNews"),
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
        fallback: (context) => Center(child: CircularProgressIndicator(),),
        condition: cubit.student_model !=null,
      ),
    );
  },
);
  }
}
