import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../../../../../app/cubit/cubit.dart';
import '../../../../../../app/cubit/state.dart';
import '../../../../../../generated/assets.dart';
import '../../../../../resources/color_manager.dart';
import '../../../../../resources/constants_manager.dart';
import '../../../../../resources/custom_widgets/custom_widget.dart';

class RequstPage extends StatefulWidget {
  const RequstPage({Key? key}) : super(key: key);

  @override
  _RequstPageState createState() => _RequstPageState();
}

class _RequstPageState extends State<RequstPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            padding: EdgeInsets.only(bottom: 25),
            margin: EdgeInsets.symmetric(horizontal: 25),
            height: double.infinity,
            width: double.infinity,
            color: ColorManager.backGround,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 20,
                ),
                defult_container(
                    h: 160.0,
                    mh: 20.0,
                    ph: 20.0,
                    pv: 20.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(60)),
                          child: Image.asset(Assets.imagesMe,fit: BoxFit.contain),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text('محمد هاني عبدالرؤف المغازي'),
                        Spacer(),

                        defult_button(
                            text: 'البيانات',
                            context: context,
                            color: AppConstants.controlPanal_photoOrdata
                                ? ColorManager.grey
                                : ColorManager.primary,
                            tcolor: ColorManager.white,
                            h: 50.0,
                            w: 120.0,
                            B: 12.0,
                            onTap: () {
                              cubit.photoORdata(false);
                            }),
                        SizedBox(
                          width: 20,
                        ),
                        defult_button(
                            text: 'الصور المدرجة',
                            context: context,
                            color: AppConstants.controlPanal_photoOrdata
                                ? ColorManager.primary
                                : ColorManager.grey,
                            tcolor: ColorManager.white,
                            h: 50.0,
                            w: 150.0,
                            B: 12.0,
                            onTap: () {
                              cubit.photoORdata(true);
                            }),
                        SizedBox(
                          width: 20,
                        ),




                        defult_button(
                            text: 'تأكيد الطلب',
                            context: context,
                            color: ColorManager.green,
                            tcolor: ColorManager.white,
                            h: 50.0,
                            w: 150.0,
                            B: 12.0,
                            onTap: () {
                              cubit.photoORdata(true);
                            }),
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Visibility(
                    visible: AppConstants.controlPanal_photoOrdata,
                    child: Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5, // Number of columns in the grid
                            crossAxisSpacing: 8.0, // Spacing between columns
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 1.3 // Spacing between rows
                            ),
                        itemCount: 10, // Number of items in the grid
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (){
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) => Dialog(
                                  child: PhotoView(
                                    initialScale: PhotoViewComputedScale.contained * 0.8,
                                      imageProvider: AssetImage(Assets.imagesMe,),
                                      ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.circular(12)
                              ),

                              child: Image.asset(Assets.imagesMe,fit: BoxFit.contain),

                            ),
                          );
                        },
                      ),
                    )),

                Visibility(
                    visible: !AppConstants.controlPanal_photoOrdata,
                    child: Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,





                          children: [

                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,




                               children: [
                                   SizedBox(width: 20,),
                                   data_widget(
                                       w:  mediaquery(context).width *0.09,

                                       text: 'ثانوي عام',
                                       icon: Icons.call_to_action,
                                       text2: 'المؤهل الدراسي'
                                   ),SizedBox(width: 20,),
                                   data_widget(w:  mediaquery(context).width *0.08,
                                       text: 'مرشح',
                                       icon: Icons.switch_left,
                                       text2: 'حالة القيد (مرشح/محول)'
                                   ),
                                   SizedBox(width: 20,),
                                   data_widget(w:  mediaquery(context).width *0.08,
                                       text: 'الاولى',
                                       icon: Icons.leaderboard_outlined,
                                       text2: 'الفرقة'
                                   ),
                                   SizedBox(width: 20,),
                                   data_widget(w:  mediaquery(context).width *0.1,
                                       text: 'علوم حاسب',
                                       icon: Icons.ac_unit,
                                       text2: 'الشعبة'
                                   ),
                                   data_widget(w:  mediaquery(context).width *0.08,
                                       text: '2024',
                                       icon: Icons.date_range,
                                       text2: 'العام الدراسي'
                                   ),


                                 SizedBox(width: 20,),


                                 ],


                             ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,




                               children: [
                                 SizedBox(width: 20,),
                                 data_widget(
                                     w:  mediaquery(context).width *0.1,

                                     text: '2024/9/12',
                                     icon: Icons.call_to_action,
                                     text2: 'تاريخ الحصول عليه'
                                 ),
                                   SizedBox(width: 20,),
                                   data_widget(w:  mediaquery(context).width *0.1,
                                       text: '23145433',
                                       icon: Icons.leaderboard_outlined,
                                       text2: 'رقم الجلوس'
                                   ),
                                   SizedBox(width: 20,),
                                   data_widget(w:  mediaquery(context).width *0.1,
                                       text: '398.3',
                                       icon: Icons.ac_unit,
                                       text2: 'المجموع'
                                   ),
                                   data_widget(w:  mediaquery(context).width *0.15,
                                       text: '30209301500131',
                                       icon: Icons.date_range,
                                       text2: 'رقم البطاقة الشخصية'
                                   ),


                                 SizedBox(width: 20,),

                                 ],


                             ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,




                               children: [
                                 SizedBox(width: 20,),
                                 data_widget(w:  mediaquery(context).width *0.2,
                                     text: 'الشهيد محمد لطفي العشري',
                                     icon: Icons.switch_left,
                                     text2: 'اسم المدرسة'
                                 ),
                                   SizedBox(width: 20,),
                                   data_widget(w:  mediaquery(context).width *0.15,
                                       text: 'محافظة كفرالشيخ',
                                       icon: Icons.leaderboard_outlined,
                                       text2: 'جهة صدور البطاقة'
                                   ),
                                   SizedBox(width: 20,),
                                   data_widget(w:  mediaquery(context).width *0.1,
                                       text: '2/2/2002',
                                       icon: Icons.ac_unit,
                                       text2: 'تاريخ الميلاد'
                                   ),
                                   data_widget(w:  mediaquery(context).width *0.1,
                                       text: 'كفر الشيخ',
                                       icon: Icons.date_range,
                                       text2: 'جهة الميلاد'
                                   ),


                                 SizedBox(width: 20,),


                                 ],


                             ),
                            //محول  بس
                            Row(
                           mainAxisAlignment: MainAxisAlignment.center,




                               children: [
                                 SizedBox(width: 20,),
                                 data_widget(w:  mediaquery(context).width *0.13,
                                     text: 'جامعة عين شمس',
                                     icon: Icons.switch_left,
                                     text2: 'الجهة المحول منها'
                                 ),
                                   SizedBox(width: 20,),
                                   data_widget(w:  mediaquery(context).width *0.1,
                                       text: '13/10/2024',
                                       icon: Icons.leaderboard_outlined,
                                       text2: 'تاريخ الموافقة'
                                   ),
                                   SizedBox(width: 20,),
                                   data_widget(w:  mediaquery(context).width *0.13,
                                       text: 'ساعات معتمدة',
                                       icon: Icons.ac_unit,
                                       text2: 'نوع التحويل'
                                   ),
                                 SizedBox(width: 20,),
                                   data_widget(w:  mediaquery(context).width *0.1,
                                       text: 'تم التحويل',
                                       icon: Icons.date_range,
                                       text2: 'حالة التحويل'
                                   ),
                                 SizedBox(width: 20,),






                                 ],


                             ),
                            //محول  بس
                            Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,

                               children: [

                                   SizedBox(width: 20,),
                                 defult_container(child: Row(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [

                                     Container(

                                       width:
                                       mediaquery(context).width *0.67,
                                       child: Text(   'ساعات معتمدةساعات معتمدةساعات معتمدةساعات معتمدةساعات معتمدةساعات معتمدةساعات معتمدةساعات معتمدةساعات معتمدةساعات معتمدةساعات معتمدةساعات معتمدة',

                                       ),
                                     )
                                   ],
                                 ),
                                   h: 250.0,
                                   w:  mediaquery(context).width *0.7,
                                   ph: 20.0,
                                   pv: 10.0,
                                   mh: 10.0,
                                   mv: 10.0,
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(top: 20.0),
                                   child: Text(': ملاحظات',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.grey),),
                                 ),

                                 SizedBox(width: 20,),
                                   data_widget(w:  mediaquery(context).width *0.1,
                                       text: 'تم الطلب',
                                       icon: Icons.date_range,
                                       text2: 'حالة الطلب'
                                   ),
                                 SizedBox(width: 20,),

                                 ],


                             ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 20,),
                                data_widget(w:  mediaquery(context).width *0.09,
                                    text: '2222231',
                                    icon: Icons.switch_left,
                                    text2: 'الرقم الثلاثي للتجنيد'
                                ),
                                SizedBox(width: 20,),
                                data_widget(w:  mediaquery(context).width *0.13,
                                    text: 'محافظة كفرالشيخ',
                                    icon: Icons.leaderboard_outlined,
                                    text2: 'منطقة التجنيد'
                                ),
                                SizedBox(width: 20,),
                                data_widget(w:  mediaquery(context).width *0.17,
                                    text: 'هاني عبدالرؤف المفغازي',
                                    icon: Icons.ac_unit,
                                    text2: 'اسم ولي امر الطالب'
                                ),  SizedBox(width: 20,),
                                data_widget(w:  mediaquery(context).width *0.1,
                                    text: 'مدرس',
                                    icon: Icons.date_range,
                                    text2: 'وظيفة ولي امر الطالب'
                                ),


                                SizedBox(width: 20,),


                              ],


                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 20,),
                                data_widget(w:  mediaquery(context).width *0.24,
                                    text: 'بيلا / كفر الشيخ',
                                    icon: Icons.switch_left,
                                    text2: 'عنوان الطالب'
                                ),
                                SizedBox(width: 20,),
                                data_widget(w:  mediaquery(context).width *0.13,
                                    text: '01029187667',
                                    icon: Icons.leaderboard_outlined,
                                    text2: 'تيلفون ولي الامر'
                                ),
                                SizedBox(width: 20,),
                                data_widget(w:  mediaquery(context).width *0.13,
                                    text: '01029187667',
                                    icon: Icons.ac_unit,
                                    text2: 'تيلفون الطالب'
                                ),  SizedBox(width: 20,),
                                data_widget(w:  mediaquery(context).width *0.1,
                                    text: '12/10/2024',
                                    icon: Icons.date_range,
                                    text2: 'تحريرا في '
                                ),




                              ],


                            ),


                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
  Widget data_widget({w,text,text2,icon})=>  Row(

    children: [
      defult_container(child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 10,),
          Text('$text')
        ],
      ),
        h: 50.0,
        w: w ,
        ph: 20.0,
        pv: 10.0,
        mh: 10.0,
        mv: 10.0,
      ),
      Text(': $text2',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.grey),),

    ],
  );
}
