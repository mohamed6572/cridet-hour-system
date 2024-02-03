// import 'package:cridet_hour_system/app/cubit/cubit.dart';
// import 'package:cridet_hour_system/app/cubit/state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class Test extends StatefulWidget {
//   const Test({Key? key}) : super(key: key);
//
//   @override
//   State<Test> createState() => _TestState();
// }
//
// class _TestState extends State<Test> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AppCubit, AppState>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         var cubit = AppCubit.get(context);
//         return Scaffold(
//           appBar: AppBar(),
//           body: Column(
//             children: [
//               Row(
//                 children: [
//                   IconButton(onPressed: (){
//                     cubit.getBirthCImage();
//                   }, icon: Icon(Icons.co2)),
//                   IconButton(onPressed: (){
//                     cubit.getIDImage();
//                   }, icon: Icon(Icons.co2)),
//                   IconButton(onPressed: (){
//                     cubit.getNomationImage();
//                   }, icon: Icon(Icons.co2)),
//                   IconButton(onPressed: (){
//                     cubit.getPersonImage();
//                   }, icon: Icon(Icons.co2)),
//                   IconButton(onPressed: (){
//                     cubit.getSoilder2Image();
//                   }, icon: Icon(Icons.co2)),
//                   IconButton(onPressed: (){
//                     cubit.getSoldier6Images();
//                   }, icon: Icon(Icons.co2)),
//                 ],
//               ),
//               IconButton(onPressed: (){
//                 print(cubit.StudentImages);
//                 cubit.uploadProfileImages(uid: '9wvGfXwdvmWA6UDTK1dZ6XYQ24r2', Images: cubit.StudentImages);
//               }, icon: Icon(Icons.co2)),
//
//               Row(
//                 children: [
//
//                   Container(
//                     width: 40,
//                     height: 40,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(4.0),
//                           topLeft: Radius.circular(4.0),
//                         ),
//                         image: DecorationImage(
//                             image: cubit.BirthCImage ==null ?
//                             NetworkImage(
//                               'https://lh3.googleusercontent.com/a/ACg8ocJPdkvb3WIU9NjqSm2szXlXlc7nTM9Q1iMWiLwb5tOQeAw=s288-c-no',
//                             ): FileImage(cubit.BirthCImage!) as ImageProvider,
//                             fit: BoxFit.cover)),
//                   ),
//                   Container(
//                     width: 40,
//                     height: 40,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(4.0),
//                           topLeft: Radius.circular(4.0),
//                         ),
//                         image: DecorationImage(
//                             image: cubit.IDImage ==null ?
//                             NetworkImage(
//                               'https://lh3.googleusercontent.com/a/ACg8ocJPdkvb3WIU9NjqSm2szXlXlc7nTM9Q1iMWiLwb5tOQeAw=s288-c-no',
//                             ): FileImage(cubit.IDImage!) as ImageProvider,
//                             fit: BoxFit.cover)),
//                   ),
//                   Container(
//                     width: 40,
//                     height: 40,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(4.0),
//                           topLeft: Radius.circular(4.0),
//                         ),
//                         image: DecorationImage(
//                             image: cubit.NomationImage ==null ?
//                             NetworkImage(
//                               'https://lh3.googleusercontent.com/a/ACg8ocJPdkvb3WIU9NjqSm2szXlXlc7nTM9Q1iMWiLwb5tOQeAw=s288-c-no',
//                             ): FileImage(cubit.NomationImage!) as ImageProvider,
//                             fit: BoxFit.cover)),
//                   ),
//                   Container(
//                     width: 40,
//                     height: 40,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(4.0),
//                           topLeft: Radius.circular(4.0),
//                         ),
//                         image: DecorationImage(
//                             image: cubit.personimage ==null ?
//                             NetworkImage(
//                               'https://lh3.googleusercontent.com/a/ACg8ocJPdkvb3WIU9NjqSm2szXlXlc7nTM9Q1iMWiLwb5tOQeAw=s288-c-no',
//                             ): FileImage(cubit.personimage!) as ImageProvider,
//                             fit: BoxFit.cover)),
//                   ),
//                   Container(
//                     width: 40,
//                     height: 40,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(4.0),
//                           topLeft: Radius.circular(4.0),
//                         ),
//                         image: DecorationImage(
//                             image: cubit.Soilder2Image ==null ?
//                             NetworkImage(
//                               'https://lh3.googleusercontent.com/a/ACg8ocJPdkvb3WIU9NjqSm2szXlXlc7nTM9Q1iMWiLwb5tOQeAw=s288-c-no',
//                             ): FileImage(cubit.Soilder2Image!) as ImageProvider,
//                             fit: BoxFit.cover)),
//                   ),
//                   Container(
//                     width: 40,
//                     height: 40,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(4.0),
//                           topLeft: Radius.circular(4.0),
//                         ),
//                         image: DecorationImage(
//                             image: cubit.Soilder6Image ==null ?
//                             NetworkImage(
//                               'https://lh3.googleusercontent.com/a/ACg8ocJPdkvb3WIU9NjqSm2szXlXlc7nTM9Q1iMWiLwb5tOQeAw=s288-c-no',
//                             ): FileImage(cubit.Soilder6Image!) as ImageProvider,
//                             fit: BoxFit.cover)),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         );
//         ;
//       },
//     );
//   }
// }
