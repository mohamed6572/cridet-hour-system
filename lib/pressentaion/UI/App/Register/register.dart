import 'package:cridet_hour_system/app/cubit/cubit.dart';
import 'package:cridet_hour_system/app/cubit/state.dart';
import 'package:cridet_hour_system/pressentaion/UI/App/Register/register_container.dart';
import 'package:cridet_hour_system/pressentaion/UI/App/login/login.dart';
import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:cridet_hour_system/pressentaion/resources/constants_manager.dart';
import 'package:cridet_hour_system/pressentaion/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Home/home_screen.dart';
import '../OnBording/OnBording.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isEnrollmentstatus = false;
  List<String> valueEnrollmentStatus = [
    AppStrings.signUp_Candidate,
    AppStrings.signUp_Adapter
  ];

  bool isGender = false;
  List<String> valueGender = [AppStrings.signUp_Female, AppStrings.signUp_Male];

  var formkey = GlobalKey<FormState>();
  var controlr_FullName = TextEditingController();
  var controlr_SchoolYear = TextEditingController();
  var controlr_DivisionInstitute = TextEditingController();
  var controlr_Band = TextEditingController();
  var controlr_EducationalQualification = TextEditingController();
  var controlr_Division = TextEditingController();
  var controlr_ReceivedData = TextEditingController();
  var controlr_SchoolName = TextEditingController();
  var controlr_SittingNumber = TextEditingController();
  var controlr_Total = TextEditingController();
  var controlr_IDcardNumber = TextEditingController();
  var controlr_ThecardIssuingParty = TextEditingController();
  var controlr_PartyTransferred = TextEditingController();
  var controlr_ApprovalDate = TextEditingController();
  var controlr_TransferType = TextEditingController();
  var controlr_Transferstatus = TextEditingController();
  var controlr_Orderstatus = TextEditingController();
  var controlr_Observance = TextEditingController();
  var controlr_DateOfBirth = TextEditingController();
  var controlr_PlaceOfBirth = TextEditingController();
  var controlr_TripleNumberRecruitment = TextEditingController();
  var controlr_Recruitmentarea = TextEditingController();
  var controlr_NameOfStudentGuardian = TextEditingController();
  var controlr_JobOfStudentGuardian = TextEditingController();
  var controlr_Studentaddress = TextEditingController();
  var controlr_Guardianphone = TextEditingController();
  var controlr_Studentphone = TextEditingController();
  var controlr_Donein = TextEditingController();
  var controlr_EmailAddress = TextEditingController();
  var controlr_Password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String ChangeValue = valueEnrollmentStatus[0];
    String ChangeGender = valueGender[0];
    var cubit = AppCubit.get(context);
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          if (state is RegisterSuccesState) {
            //AppConstants.navigateToAndFinish(context, HomeScreen());
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Register Succses Going To Home ...',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                  key: formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Image.asset(
                        //   'assets/images/logo.png',
                        //   width: MediaQuery.of(context).size.height * 0.20,
                        //   height: MediaQuery.of(context).size.height * 0.20,
                        // ),

                        Container(
                          height: MediaQuery.of(context).size.height * 0.9,
                          // height: MediaQuery.of(context).size.height /1.5,
                          padding: EdgeInsets.all(20),

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorManager.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 1),
                                    blurRadius: 7,
                                    color: ColorManager.grey)
                              ]),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 35,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        AppConstants.navigateTo(
                                            context, Login_screen());
                                      },
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: ColorManager.black,
                                        size: 20,
                                      ),
                                      color: Colors.black,
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.transparent))),
                                  SizedBox(
                                    width: MediaQuery.sizeOf(context).width / 6,
                                  ),
                                  Text(
                                    AppStrings.signUp,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                  ),
                                  Spacer(),
                                ],
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height / 1.45,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      TextField(
                                          text: AppStrings.signUp_FullName,
                                          controller: controlr_FullName,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return 'ِ${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      TextField(
                                          text: AppStrings.signUp_SchoolYear,
                                          controller: controlr_SchoolYear,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      TextField(
                                          text: AppStrings
                                              .signUp_DivisionInstitute,
                                          controller:
                                              controlr_DivisionInstitute,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      TextField(
                                          text: AppStrings.signUp_EmailAddress,
                                          controller: controlr_EmailAddress,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      TextField(
                                          text: AppStrings.signUp_Password,
                                          controller: controlr_Password,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppStrings.signUp_Enrollmentstatus,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Radio<String>(
                                            activeColor: ColorManager.primary,
                                            value: 'one',
                                            groupValue: ChangeValue,
                                            onChanged: (value) {
                                              setState(() {
                                                isEnrollmentstatus = false;

                                                valueEnrollmentStatus[0] =
                                                    value.toString();
                                              });
                                            },
                                          ),
                                          Text(AppStrings.signUp_Candidate,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall),
                                          Radio<String>(
                                            activeColor: ColorManager.primary,
                                            value: 'two',
                                            groupValue: ChangeValue,
                                            onChanged: (value) {
                                              setState(() {
                                                isEnrollmentstatus = true;

                                                valueEnrollmentStatus[0] =
                                                    value.toString();
                                              });
                                            },
                                          ),
                                          Text(AppStrings.signUp_Adapter,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall),
                                        ],
                                      ),
                                      TextField(
                                          text: AppStrings.signUp_Band,
                                          controller: controlr_Band,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      TextField(
                                          text: AppStrings
                                              .signUp_EducationalQualification,
                                          controller:
                                              controlr_EducationalQualification,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      TextField(
                                          text: AppStrings.signUp_Division,
                                          controller: controlr_Division,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      TextField(
                                          text: AppStrings.signUp_ReceivedData,
                                          controller: controlr_ReceivedData,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      TextField(
                                          text: AppStrings.signUp_SchoolName,
                                          controller: controlr_SchoolName,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      TextField(
                                          text: AppStrings.signUp_SittingNumber,
                                          controller: controlr_SittingNumber,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      TextField(
                                          text: AppStrings.signUp_Total,
                                          controller: controlr_Total,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      TextField(
                                          text: AppStrings.signUp_IDcardNumber,
                                          controller: controlr_IDcardNumber,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      TextField(
                                          text: AppStrings
                                              .signUp_ThecardIssuingParty,
                                          controller:
                                              controlr_ThecardIssuingParty,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      Visibility(
                                        visible: isEnrollmentstatus,
                                        child: Column(
                                          children: [
                                            TextField(
                                                text: AppStrings
                                                    .signUp_PartyTransferred,
                                                controller:
                                                    controlr_PartyTransferred,
                                                validator: (text) {
                                                  if (text == null ||
                                                      text.isEmpty) {
                                                    return '${AppStrings.validate_message_signUp}';
                                                  }
                                                }),
                                            TextField(
                                                text: AppStrings
                                                    .signUp_ApprovalDate,
                                                controller:
                                                    controlr_ApprovalDate,
                                                validator: (text) {
                                                  if (text == null ||
                                                      text.isEmpty) {
                                                    return '${AppStrings.validate_message_signUp}';
                                                  }
                                                }),
                                            TextField(
                                                text: AppStrings
                                                    .signUp_TransferType,
                                                controller:
                                                    controlr_TransferType,
                                                validator: (text) {
                                                  if (text == null ||
                                                      text.isEmpty) {
                                                    return '${AppStrings.validate_message_signUp}';
                                                  }
                                                }),
                                            TextField(
                                                text: AppStrings
                                                    .signUp_Transferstatus,
                                                controller:
                                                    controlr_Transferstatus,
                                                validator: (text) {
                                                  if (text == null ||
                                                      text.isEmpty) {
                                                    return '${AppStrings.validate_message_signUp}';
                                                  }
                                                }),
                                            TextField(
                                                text: AppStrings
                                                    .signUp_Orderstatus,
                                                controller:
                                                    controlr_Orderstatus,
                                                validator: (text) {
                                                  if (text == null ||
                                                      text.isEmpty) {
                                                    return '${AppStrings.validate_message_signUp}';
                                                  }
                                                })
                                          ],
                                        ),
                                      ),
                                      TextField(
                                          text: AppStrings.signUp_Observance,
                                          controller: controlr_Observance,
                                          content: 4,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      TextField(
                                          text: AppStrings.signUp_DateOfBirth,
                                          controller: controlr_DateOfBirth,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      TextField(
                                          text: AppStrings.signUp_PlaceOfBirth,
                                          controller: controlr_PlaceOfBirth,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      TextField(
                                          text: AppStrings
                                              .signUp_TripleNumberRecruitment,
                                          controller:
                                              controlr_TripleNumberRecruitment,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      TextField(
                                          text:
                                              AppStrings.signUp_Recruitmentarea,
                                          controller: controlr_Recruitmentarea,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      TextField(
                                          text: AppStrings
                                              .signUp_NameOfStudentGuardian,
                                          controller:
                                              controlr_NameOfStudentGuardian,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      TextField(
                                          text: AppStrings
                                              .signUp_JobOfStudentGuardian,
                                          controller:
                                              controlr_JobOfStudentGuardian,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      TextField(
                                          text:
                                              AppStrings.signUp_Studentaddress,
                                          controller: controlr_Studentaddress,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      TextField(
                                          text: AppStrings.signUp_Guardianphone,
                                          controller: controlr_Guardianphone,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      TextField(
                                          text: AppStrings.signUp_Studentphone,
                                          controller: controlr_Studentphone,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      TextField(
                                          text: AppStrings.signUp_Donein,
                                          controller: controlr_Donein,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return '${AppStrings.validate_message_signUp}';
                                            }
                                          }),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppStrings.signUp_Gender,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Radio<String>(
                                            activeColor: ColorManager.primary,
                                            value: 'one',
                                            groupValue: ChangeGender,
                                            onChanged: (value) {
                                              setState(() {
                                                isGender = false;
                                                print(isGender);
                                                valueGender[0] =
                                                    value.toString();
                                              });
                                            },
                                          ),
                                          Text(AppStrings.signUp_Female,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.20,
                                          ),
                                          Radio<String>(
                                            activeColor: ColorManager.primary,
                                            value: 'two',
                                            groupValue: ChangeGender,
                                            onChanged: (value) {
                                              setState(() {
                                                isGender = true;
                                                print(isGender);
                                                valueGender[0] =
                                                    value.toString();
                                              });
                                            },
                                          ),
                                          Text(AppStrings.signUp_Male,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppStrings.signUp_Nominationcard,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                          Spacer(),
                                          RegisterContainer(
                                            onTap: () {
                                              cubit.getNomationImage();
                                            },
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppStrings.signUp_Photograph,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                          Spacer(),
                                          RegisterContainer(
                                            onTap: () {
                                              cubit.getPersonImage();
                                            },
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppStrings
                                                .signUp_OriginalBirthcertificate,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                          Spacer(),
                                          RegisterContainer(
                                            onTap: () {
                                              cubit.getBirthCImage();
                                            },
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppStrings.signUp_PhotoIDNumber,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                          Spacer(),
                                          RegisterContainer(
                                            onTap: () {
                                              cubit.getIDImage();
                                            },
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Visibility(
                                        visible: isGender,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  AppStrings.signUp_2soldiers,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                ),
                                                Spacer(),
                                                RegisterContainer(
                                                  onTap: () {
                                                    cubit.getSoilder2Image();
                                                  },
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  AppStrings.signUp_6soldiers,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                ),
                                                Spacer(),
                                                RegisterContainer(
                                                  onTap: () {
                                                    cubit.getSoldier6Images();
                                                  },
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      if(cubit.Soilder2Image ==null && cubit.Soilder6Image ==null &&cubit.personimage ==null&&cubit.NomationImage ==null&& cubit.IDImage ==null&& cubit.BirthCImage ==null)
                                        Container(
                                        width: double.infinity,
                                          height: 150,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(4.0),
                                                topLeft: Radius.circular(4.0),
                                              ),
                                              image: DecorationImage(
                                                  image:
                                                  AssetImage('assets/images/upload.png'),
                                                  fit: BoxFit.cover)),
                                        ),

                                        Row(
                                        children: [
                                          if( cubit.BirthCImage !=null)
                                          Expanded(
                                            child: Container(
                                             
                                              height: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(4.0),
                                                    topLeft: Radius.circular(4.0),
                                                  ),
                                                  image: DecorationImage(
                                                      image: 
                                                      FileImage(cubit.BirthCImage!) as ImageProvider,
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),
                                          if( cubit.IDImage !=null)
                                          Expanded(
                                            child: Container(
                                            
                                              height: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(4.0),
                                                    topLeft: Radius.circular(4.0),
                                                  ),
                                                  image: DecorationImage(
                                                      image:FileImage(cubit.IDImage!) as ImageProvider,
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          if(cubit.NomationImage !=null)
                                          Expanded(
                                            child: Container(

                                              height: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(4.0),
                                                    topLeft: Radius.circular(4.0),
                                                  ),
                                                  image: DecorationImage(
                                                      image: FileImage(cubit.NomationImage!) as ImageProvider,
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),
                                          if(cubit.personimage !=null)
                                          Expanded(
                                            child: Container(

                                              height: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(4.0),
                                                    topLeft: Radius.circular(4.0),
                                                  ),
                                                  image: DecorationImage(
                                                      image: FileImage(cubit.personimage!) as ImageProvider,
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          if(cubit.Soilder2Image !=null )
                                          Expanded(
                                            child: Container(

                                              height: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(4.0),
                                                    topLeft: Radius.circular(4.0),
                                                  ),
                                                  image: DecorationImage(
                                                      image:FileImage(cubit.Soilder2Image!) as ImageProvider,
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),
                                          if(cubit.Soilder6Image !=null)
                                          Expanded(
                                            child: Container(

                                              height: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(4.0),
                                                    topLeft: Radius.circular(4.0),
                                                  ),
                                                  image: DecorationImage(
                                                      image: FileImage(cubit.Soilder6Image!) as ImageProvider,
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              print(controlr_EmailAddress.text);
                                              if (formkey.currentState
                                                      ?.validate() ==
                                                  true) {
                                                cubit.registerWithEmailAndPassword(
                                                    Images: cubit.StudentImages,
                                                    email: controlr_EmailAddress
                                                        .text,
                                                    password:
                                                        controlr_Password.text,
                                                    context: context,
                                                    approvalDate:
                                                        controlr_ApprovalDate
                                                            .text,
                                                    band: controlr_Band.text,
                                                    bandDivision:
                                                        controlr_Division.text,
                                                    enrollmentStatus:
                                                        isEnrollmentstatus,
                                                    basicStudentData:
                                                        'basicStudentData',
                                                    birthDayImage:
                                                        'birthDayImage',
                                                    cardIssuingParty:
                                                        controlr_ThecardIssuingParty
                                                            .text,
                                                    dateOfBirth:
                                                        controlr_DateOfBirth
                                                            .text,
                                                    soldiers_image_1:
                                                        'soldiers_image_1.text',
                                                    soldiers_image_2:
                                                        'soldiers_image_2',
                                                    degreeTotal:
                                                        controlr_Total.text,
                                                    divisionInstitute:
                                                        controlr_DivisionInstitute
                                                            .text,
                                                    doneIn:
                                                        controlr_Donein.text,
                                                    educationalQualification:
                                                        controlr_EducationalQualification
                                                            .text,
                                                    fatherJob:
                                                        controlr_JobOfStudentGuardian
                                                            .text,
                                                    fatherName:
                                                        controlr_NameOfStudentGuardian
                                                            .text,
                                                    gender: isGender == true
                                                        ? 'Male'
                                                        : 'False',
                                                    gpa: 0.0,
                                                    guardianPhone:
                                                        controlr_Guardianphone
                                                            .text,
                                                    idCardNumber:
                                                        controlr_IDcardNumber.text,
                                                    idPhoto: 'idPhoto',
                                                    image: 'image',
                                                    military: isGender,
                                                    name: controlr_FullName.text,
                                                    nominationCard: 'nominationCard',
                                                    observance: controlr_Observance.text,
                                                    orderStatus: controlr_Orderstatus.text,
                                                    partyTransferred: controlr_PartyTransferred.text,
                                                    phone: controlr_Studentphone.text,
                                                    photograph: 'photograph',
                                                    placeBirth: controlr_PlaceOfBirth.text,
                                                    receivedData: controlr_ReceivedData.text,
                                                    recruitmentArea: controlr_Recruitmentarea.text,
                                                    schoolName: controlr_SchoolName.text,
                                                    schoolYear: controlr_SchoolYear.text,
                                                    sittingNumber: controlr_SittingNumber.text,
                                                    studentAddress: controlr_Studentaddress.text,
                                                    studentPhone: controlr_Studentphone.text,
                                                    transferStatus: controlr_Transferstatus.text,
                                                    transferType: controlr_TransferType.text,
                                                    tripleNumber: controlr_TripleNumberRecruitment.text);
                                              }
                                            },
                                            child: Text(
                                              AppStrings.signUp_Registration,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }

  Widget TextField({required text, validator, content, required controller}) =>
      Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: text,
          ),
          style: TextStyle(fontSize: 14),
          maxLines: content,
          controller: controller,
          validator: validator,
        ),
      );
}
