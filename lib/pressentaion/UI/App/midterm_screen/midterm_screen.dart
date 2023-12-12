import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Exam_Screan extends StatefulWidget {
  static const String routeName = 'Exam';

  @override
  State<Exam_Screan> createState() => _Exam_ScreanState();
}

class _Exam_ScreanState extends State<Exam_Screan> {
  bool? _checked = false;
  bool? _checked2 = false;
  bool? _checked3 = false;
  bool? _checked4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: ColorManager.primary,

                        borderRadius: BorderRadius.circular(30)),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                left: BorderSide(color: Colors.white, width: 4),
                                right: BorderSide(color: Colors.white, width: 4),
                                bottom: BorderSide(color: Colors.white, width: 4),
                                top: BorderSide(color: Colors.white, width: 4),
                              ),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border(
                              left: BorderSide(color: Colors.white, width: 2),
                              right: BorderSide(color: Colors.white, width: 2),
                              bottom: BorderSide(color: Colors.white, width: 2),
                              top: BorderSide(color: Colors.white, width: 2),
                            ),
                          ),
                          child: Text(
                            'امتحان على اسم الفاعل',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 30),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        defultContainer(
                          radius: 40.0,
                          b1: 2.0,
                          b2: 2.0,
                          b3: 2.0,
                          b4: 2.0,
                          width: 80.0,
                          widget: Center(child: Text('30:00')),
                          height: 80.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defultContainer(
                    radius: 20.0,
                    b1: 1.0,
                    b2: 1.0,
                    b3: 1.0,
                    b4: 1.0,
                    width: 80.0,
                    widget: Center(child: Text('صورة السؤال')),
                    height: 140.0,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Text(
                    'س  :- اعرب كلمة (الرحمن)من( بسم الله الرحمن الرحيم)',
                    textAlign: TextAlign.end,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  qusetion(text: '١- مبتدأ ', check: _checked),
                  qusetion(text: '٢- خبر ', check: _checked2),
                  qusetion(text: '٣- مفعول به', check: _checked3),
                  qusetion(text: '٤- فاعل ', check: _checked4),
                  SizedBox(
                    height: 30,
                  ),

                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    defultButton(text: "التالي", function: (){},
                        Background: Colors.green,
                        radius: 20,
                        textSize: 20,
                        width: 100
                    ),
                    defultButton(text: "السابق", function: (){},
                        Background: Colors.red,
                        textSize: 20,
                        radius: 20,
                        width: 100
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ));
  }

  Widget qusetion({text, check}) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Checkbox(
        // controlAffinity: ListTileControlAffinity.leading,
          activeColor: Colors.green,
          value: check,
          onChanged: (bool? value) {
            setState(() {
              check = value;
            });
          }),
      Text(
        text,
        style:
        Theme.of(context).textTheme.headline1!.copyWith(fontSize: 25),
      ),
    ],
  );
  Widget defultContainer({required widget, double? width,double? height,
    double b1 = 1.0,
    double b2 = 1.0,
    double b3 = 1.0,
    double b4 = 1.0,
    Color color =Colors.black,
    Color backgraondColor= Colors.white ,
    radius =9.0,
  }) => Container(
      width: width,
      height: height,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgraondColor,
          border: Border(
            left: BorderSide(color: color, width: b1),
            right: BorderSide(color: color, width: b2),
            bottom: BorderSide(color: color, width: b3),
            top: BorderSide(color: color, width: b4),
          )),
      child: widget);
  Widget defultButton({
    double width = double.infinity,
    required Color Background ,
    Color textColor = Colors.white,
    Color borderColor = Colors.white,
    bool isUpperCase = true,
    double radius = 0.0,
    double? textSize,
    required String text,
    required VoidCallback function,
  }) =>
      Container(
        width: width,
        child: MaterialButton(
          onPressed: function,

          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(color: textColor, fontSize: textSize,fontFamily: 'Cairo'),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: Background,
            border: Border(
              left: BorderSide(color: borderColor, width: 1),
              right: BorderSide(color: borderColor, width: 1),
              bottom: BorderSide(color: borderColor, width: 1),
              top: BorderSide(color: borderColor, width: 1),
            )),
      );

}
