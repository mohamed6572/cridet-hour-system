import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cridet_hour_system/app/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../pressentaion/UI/control_panal/screens/last_exams/last_exams.dart';
import '../../pressentaion/UI/control_panal/screens/lecuters/lectur.dart';
import '../../pressentaion/UI/control_panal/screens/midle_exams/midle_exams.dart';
import '../../pressentaion/UI/control_panal/screens/requst/requst.dart';
import '../../pressentaion/UI/control_panal/screens/sections/sections.dart';
import '../../pressentaion/UI/control_panal/screens/student/student.dart';
import '../../pressentaion/UI/control_panal/screens/subjects/subjet.dart';
import '../../pressentaion/UI/control_panal/screens/tables/tables_widget.dart';
import '../../pressentaion/UI/control_panal/screens/upload_absence_presence/upload_absence_presence.dart';
import '../../pressentaion/resources/constants_manager.dart';



class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppIniteal());

  static AppCubit get(context) => BlocProvider.of(context);

//control panal
  int drwerIndex  =0;
  void changeControlPanal_Screens_Index(index){
    AppConstants.controlPanal_Screens_Index = index;
    drwerIndex = index;

    emit(changeControlPanal_Screens_IndexState());
  }
  void photoORdata(v){
    AppConstants.controlPanal_photoOrdata = v;

    emit(changeControlPanal_Screens_IndexState());
  }

  List<Widget> controlPanal_Screens = [
    REQUST(),
    Student(),
    Upload_AbsencePresence(),
    Subject(),
    Lectuer(),
    Sections(),
    TablesWidget(),
    MidleExams(),
    LastExams()

  ];
  List<String> lectuerLinkList  = [
    'nvsikdf',
    'nvsikdfxcas',
    'nvsikdf2',
  ];
  List<String> sectionsLinkList  = [
    'nvsikdf',
    'nvsikdfxcas',
  ];
  void AddToList({ String? value,required list,required bool remove,index}) {
    if(!remove){
      list.add(value);
    } if(remove){
      list.removeAt(index);
    }
    emit(AddLinkToList_State());
  }

  File? Table_image;
  Future<void> getTableImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {

      Table_image = File(pickedFile.path);
      emit(choseTableImage_State());
    }
  }
  File? Last_Exma_image;
  Future<void> getLastExamImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {

      Last_Exma_image = File(pickedFile.path);
      emit(choseLastExamImage_State());
    }
  }

}
