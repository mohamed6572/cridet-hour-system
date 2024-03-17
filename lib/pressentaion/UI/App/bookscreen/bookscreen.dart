import 'package:cridet_hour_system/app/cubit/cubit.dart';
import 'package:cridet_hour_system/app/cubit/state.dart';
import 'package:cridet_hour_system/generated/assets.dart';
import 'package:cridet_hour_system/pressentaion/resources/constants_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/custom_widgets/custom_widget.dart';
import '../../../resources/values_manager.dart';
import 'PDFViewer.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  Future<void> _refreshData(BuildContext context) async {
    final cubit = AppCubit.get(context);

    cubit.Get_Subject_FirstGrad(context: context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppCubit.get(context).Get_Subject_FirstGrad(context: context);
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(builder: (context, state) {
      var cubit =AppCubit.get(context);
      return Scaffold(
        appBar: app_AppBar(context: context,text: 'Books'),
        body: RefreshIndicator(
            color: ColorManager.primary,
            onRefresh: () => _refreshData(context),
            child:state is GetSubject_firstGrad_LoadingState ? Center(child: CircularProgressIndicator(),) :Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(


                    itemCount:cubit.student_model!.last_subject!.isNotEmpty ? cubit.student_model?.subjects?.length : cubit.firstGrade_subjects.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          AppConstants.navigateTo(context, PDFViewer_Screen('${cubit.student_model!.last_subject!.isNotEmpty ? cubit.student_model!.subjects![index].nameSubject : cubit.firstGrade_subjects[index].nameSubject}'));
                        },
                        child: defult_container(
                            w: double.infinity,
                            color:  ColorManager.primary,
                            ph: 10.0,
                            child: Center(
                              child: Text(
                                '${cubit.student_model!.last_subject!.isNotEmpty ? cubit.student_model!.subjects![index].nameSubject :cubit.firstGrade_subjects[index].nameSubject}',
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.white),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              ),
                            ),
                            pv: 10.0),
                      );
                    }, padding: EdgeInsets.all(AppPadding.p4),
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.7,
                      mainAxisSpacing: 15.0,
                      crossAxisSpacing: 5.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )),
      );
    }, listener: (context, state) {

    },);
  }
}
