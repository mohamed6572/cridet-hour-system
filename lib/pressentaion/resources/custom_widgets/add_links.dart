import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/cubit/cubit.dart';
import '../../../app/cubit/state.dart';
import '../color_manager.dart';
import '../constants_manager.dart';
import '../strings_manager.dart';
import '../values_manager.dart';
import 'custom_widget.dart';

class AddLinks extends StatefulWidget {
   AddLinks({required this.index,required this.name,required this.list}) ;
int index;
String name;
List? list;

  @override
  _AddLinksState createState() => _AddLinksState();
}

class _AddLinksState extends State<AddLinks> {
  var _formKey= GlobalKey<FormState>();
  var LinkControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppConstants.defult_appBar(context: context,title: '${widget.name} + ${widget.index}'),
          body: Padding(
            padding:  EdgeInsets.all(AppPadding.p20),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Form(
                    key: _formKey,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              cubit.AddToList(
                                  remove: false,
                                  list: widget.list,
                                  value: LinkControler.text);

                              LinkControler.clear();
                            }
                          },
                        ),
                        SizedBox(
                          width: AppPadding.p40,
                        ),
                        Expanded(
                          flex: 2,
                          child: def_TextFormField(
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                            hintText: AppStrings.addLink,
                            horizontal: 0.0,
                            virtical: 10.0,
                            controller: LinkControler,
                            context: context,
                            maxLines: 1,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'برجاء اضافة لينك';
                              }
                              return null;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(

                      height: mediaquery(context).height*0.9,
                      width: double.infinity,

                      color: ColorManager.lightgrey,
                      padding: EdgeInsets.all(AppPadding.p20),
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => Row(
                          children: [
                            Expanded(
                                child: Text(
                                  '$index - ${widget.list![index]}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )),
                            InkWell(
                              onTap: () {
                                cubit.AddToList(
                                    remove: true,
                                    list: widget.list,
                                    index: index);
                              },
                              child: Container(
                                  padding: EdgeInsets.all(AppPadding.p8),
                                  child: Icon(Icons.close,
                                      size: 15, color: ColorManager.error)),
                            )
                          ],
                        ),
                        itemCount: widget.list!.length,
                        separatorBuilder: (context, index) =>
                            AppConstants.def_divider(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
