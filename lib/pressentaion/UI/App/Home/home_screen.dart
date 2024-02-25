import 'dart:async';

import 'package:buildcondition/buildcondition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cridet_hour_system/app/cubit/cubit.dart';
import 'package:cridet_hour_system/app/cubit/state.dart';
import 'package:cridet_hour_system/generated/assets.dart';
import 'package:cridet_hour_system/pressentaion/UI/App/Home/student_data.dart';
import 'package:cridet_hour_system/pressentaion/UI/App/courses/courses_screen.dart';
import 'package:cridet_hour_system/pressentaion/UI/App/login/login.dart';
import 'package:cridet_hour_system/pressentaion/UI/App/midterm_screen/midterm_screen.dart';
import 'package:cridet_hour_system/pressentaion/UI/App/schedule/schedule_screen.dart';
import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:cridet_hour_system/pressentaion/resources/constants_manager.dart';
import 'package:cridet_hour_system/pressentaion/resources/custom_widgets/custom_widget.dart';
import 'package:cridet_hour_system/pressentaion/resources/models/user/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bookscreen/bookscreen.dart';
import '../importantNews/importantNews.dart';
import '../prev_exams/prev_exams.dart';
import 'component/container.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _refreshData(BuildContext context) async {
    AppCubit.get(context).getUserData();

  }
  Timer? _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppCubit.get(context).getUserData();
   
    _timer = Timer(const Duration(seconds: 6), ()async{
      if (AppCubit.get(context).student_model?.logOut == true) {
        print('logiut : ${AppCubit.get(context).student_model?.logOut}');
        await FirebaseAuth.instance.signOut();
        AppConstants.navigateToAndFinish(context, Login_screen());
      }

    });

  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {

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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: ColorManager.white,
                            size: 25,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Egypt,Kafr El-sheik",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleLarge,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.call,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "01099340772",
                            style: Theme.of(context).textTheme.titleLarge,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.mail,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Himit@gmail.com",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),


                        ],
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.all(10),
                  //   child: InkWell(
                  //     onTap:(){
                  //
                  //     },
                  //     child:Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: [
                  //         Icon(
                  //           Icons.logout,
                  //           color: Colors.red,
                  //           size: 25,
                  //         ),
                  //         SizedBox(
                  //           width: 5,
                  //         ),
                  //         Text(
                  //           "Log out",
                  //           style: Theme.of(context).textTheme.titleLarge,
                  //         ),
                  //
                  //
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height:200,),
                  Padding(
                    padding:EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () async {
                            final Uri _url = Uri.parse(
                                'https://www.facebook.com/Himit2018');

                            if (!await launchUrl(_url)) {
                              throw Exception('Could not launch $_url');
                            }
                          },
                          child: Icon(
                            Icons.facebook_rounded,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            final Uri _url = Uri.parse(
                                'https://www.youtube.com/watch?v=6mttoWXoqOU&list=PLgxZ0iwvK8rc5mawQkFp9BqMyMcihFcAZ&pp=iAQB');

                            if (!await launchUrl(_url)) {
                              throw Exception('Could not launch $_url');
                            }
                          },
                          child: Icon(
                            Icons.smart_display_rounded,
                            color: ColorManager.error,
                            size: 25,
                          ),
                        ),
                      
                        InkWell(
                          onTap: () async {
                            final Uri _url = Uri.parse(
                                'https://himit-kfs.com/?fbclid=IwAR2dsMkEqlaXN2O3ISXI5WX26E_s5DiuvkkagohkphN3yT7hVXGE3PmFp0E');

                            if (!await launchUrl(_url)) {
                              throw Exception('Could not launch $_url');
                            }
                          },
                          child: Icon(
                            Icons.web,
                            color: ColorManager.white,
                            size: 25,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body:RefreshIndicator(
          color: ColorManager.primary,
          onRefresh: () => _refreshData(context),
          child: state is getUserLoadingState ?Center(child: CircularProgressIndicator(),): BuildCondition(
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
                              Container(
                                width: MediaQuery.sizeOf(context).width/2.4,
                                child: Text("${cubit.student_model!.name}",
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16)),
                              ),
                              Center(
                                child: Text(" ${cubit.student_model!.level}",
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14)),
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
                                  height: mediaquery(context).height/2,

                                  child: SingleChildScrollView(
                                    child:Column(
                                      children: [
                                        Icon(Icons.warning_amber,color: ColorManager.error,),
                                        SizedBox(height: 20,),
                                        Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Container(

                                            height: mediaquery(context).height/2.6,
                                            child: ListView.separated(
                                              separatorBuilder: (context, index) => Divider(),
                                              itemCount: cubit.Warning_List.length,
                                              itemBuilder: (context, index) => Text("${cubit.Warning_List[index]}",textAlign: TextAlign.start,),),
                                          ),
                                        )
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
AppConstants.navigateTo(context, Prev_Exmas_Screen());

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
      )),
    );
  },
);
  }
}
