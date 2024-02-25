import 'package:cridet_hour_system/app/cubit/cubit.dart';
import 'package:cridet_hour_system/app/cubit/state.dart';
import 'package:cridet_hour_system/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/custom_widgets/custom_widget.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  Future<void> _refreshData(BuildContext context) async {
    final cubit = AppCubit.get(context);

    cubit.GetCousrsData(context: context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppCubit.get(context).GetCousrsData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: app_AppBar(context: context, text: 'Courses'),
          body: RefreshIndicator(
              color: ColorManager.primary,
              onRefresh: () => _refreshData(context),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                      itemCount: cubit.CourseLinkList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () async {
                            final Uri _url = Uri.parse(
                                '${cubit.CourseLinkList[index].Link}');

                            if (!await launchUrl(_url)) {
                              throw Exception('Could not launch $_url');
                            }
                          },
                          child: defult_container(
                              w: double.infinity,
                              ph: 10.0,
                              child: Text(
                                '${cubit.CourseLinkList[index].name}',
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.start,
                              ),
                              pv: 10.0),
                        );
                      },
                    ),
                  )
                ],
              )),
        );
      },
      listener: (context, state) {},
    );
  }
}
