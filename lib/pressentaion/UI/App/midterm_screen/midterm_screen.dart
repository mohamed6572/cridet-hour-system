import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:flutter/material.dart';

class Midterm_Exam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Software Engineering",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.all(20),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: ColorManager.white),
                  child: Center(
                      child: Text(
                    "1:00",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color:Colors.green)
                  )),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorManager.white),
                  child: Text(
                    "1-what is software Engineering?",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
              Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      width: 300,
                      child: Text(
                          "is the branch of computer science that deals with the design."),
                    ),
                    Icon(
                      Icons.check_circle,
                      size: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      width: 300,
                      child: Text(
                          "is the branch of computer science that deals with the design."),
                    ),
                    Icon(
                      Icons.check_circle,
                      size: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      width: 300,
                      child: Text(
                          "is the branch of computer science that deals with the design."),
                    ),
                    Icon(
                      Icons.check_circle,
                      size: 20,
                    ),
                  ],
                ),
              ),
              Divider(
                color: ColorManager.primary,
                height: 10,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorManager.white),
                  child: Text(
                    "2-what is software Engineering?",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
              Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      width: 300,
                      child: Text(
                          "is the branch of computer science that deals with the design."),
                    ),
                    Icon(
                      Icons.check_circle,
                      size: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      width: 300,
                      child: Text(
                          "is the branch of computer science that deals with the design."),
                    ),
                    Icon(
                      Icons.check_circle,
                      size: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      width: 300,
                      child: Text(
                          "is the branch of computer science that deals with the design."),
                    ),
                    Icon(
                      Icons.check_circle,
                      size: 20,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Save',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: ColorManager.white),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
