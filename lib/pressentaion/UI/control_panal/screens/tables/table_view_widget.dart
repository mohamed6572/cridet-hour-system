import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';

import '../../../../../app/cubit/cubit.dart';
import '../../../../../app/cubit/state.dart';
import '../../../../../generated/assets.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/constants_manager.dart';
import '../../../../resources/custom_widgets/custom_widget.dart';

class TableViewWidget extends StatefulWidget {

  TableViewWidget({required this.index, required this.title});
  int index;
  String title;

  @override
  State<TableViewWidget> createState() => _TableViewWidgetState();
}

class _TableViewWidgetState extends State<TableViewWidget> {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppConstants.defult_appBar(context: context,title: ' جداول ${widget.title}'),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(

                children: [

                  ElevatedButton(onPressed: (){
                    cubit.getTableImage();
                  }, child: Text('رفع الملفات كصورة')),
                  SizedBox(height: 20,),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5, // Number of columns in the grid
                          crossAxisSpacing: 8.0, // Spacing between columns
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 1.3 // Spacing between rows
                      ),
                      itemCount: 1, // Number of items in the grid
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

                            child: Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                Container(
                            width:double.infinity,
                            height:double.infinity,

                                    child: cubit.Table_image != null ?Image(image:  FileImage(cubit.Table_image!),fit: BoxFit.fill) : Image.asset(Assets.imagesMe,fit: BoxFit.fill)),
                                InkWell(
                                  onTap: (){

                                  },
                                  child: Container(

                                    margin: EdgeInsets.all(10),
                                    height: 40,
                                    width: 40,


                                    child: Icon(
                                      Icons.delete_forever,
                                      color: ColorManager.error,
                                    ),
                                  ),
                                )
                              ],
                            ),

                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
