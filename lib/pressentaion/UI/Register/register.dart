import 'package:cridet_hour_system/pressentaion/UI/OnBording/OnBording.dart';
import 'package:cridet_hour_system/pressentaion/UI/Register/register_container.dart';
import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:cridet_hour_system/pressentaion/resources/constants_manager.dart';
import 'package:cridet_hour_system/pressentaion/resources/strings_manager.dart';
import 'package:flutter/material.dart';

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
  List<String> valueGender = [
    AppStrings.signUp_Female,
    AppStrings.signUp_Male
  ];

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
          Form(
            key: formkey,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: MediaQuery.of(context).size.height * 0.20,
                  height: MediaQuery.of(context).size.height * 0.20,
                ),
                Spacer(),
                Container(
                  height: MediaQuery.of(context).size.height *0.70,
                  // height: MediaQuery.of(context).size.height /1.5,
                  padding: EdgeInsets.all(20),
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400, // Color of the shadow
                        offset: Offset(0, 2), // Offset of the shadow
                        blurRadius: 4, // Spread of the shadow
                        spreadRadius: 0, // Extent of the shadow
                      ),
                    ],),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.signUp,
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ],
                        ),
                        SizedBox(height: 35,),
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
                            text: AppStrings.signUp_DivisionInstitute,
                            controller: controlr_DivisionInstitute,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.signUp_Enrollmentstatus,
                              style: Theme.of(context).textTheme.displayLarge,
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
                                  valueEnrollmentStatus[0] = value.toString();
                                });
                              },
                            ),
                            Text(AppStrings.signUp_Candidate,style: Theme.of(context).textTheme.bodySmall),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.20,
                            ),
                            Radio<String>(
                              activeColor: ColorManager.primary,
                              value: 'two',
                              groupValue: ChangeValue,
                              onChanged: (value) {
                                setState(() {
                                  isEnrollmentstatus = true;
                                  valueEnrollmentStatus[0] = value.toString();
                                });
                              },
                            ),
                            Text(AppStrings.signUp_Adapter,style: Theme.of(context).textTheme.bodySmall),
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
                            text: AppStrings.signUp_EducationalQualification,
                            controller: controlr_EducationalQualification,
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
                            text: AppStrings.signUp_ThecardIssuingParty,
                            controller: controlr_ThecardIssuingParty,
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
                                  text: AppStrings.signUp_PartyTransferred,
                                  controller: controlr_PartyTransferred,
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return '${AppStrings.validate_message_signUp}';
                                    }
                                  }),
                              TextField(
                                  text: AppStrings.signUp_ApprovalDate,
                                  controller: controlr_ApprovalDate,
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return '${AppStrings.validate_message_signUp}';
                                    }
                                  }),
                              TextField(
                                  text: AppStrings.signUp_TransferType,
                                  controller: controlr_TransferType,
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return '${AppStrings.validate_message_signUp}';
                                    }
                                  }),
                              TextField(
                                  text: AppStrings.signUp_Transferstatus,
                                  controller: controlr_Transferstatus,
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return '${AppStrings.validate_message_signUp}';
                                    }
                                  }),
                              TextField(
                                  text: AppStrings.signUp_Orderstatus,
                                  controller: controlr_Orderstatus,
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
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
                            text: AppStrings.signUp_TripleNumberRecruitment,
                            controller: controlr_TripleNumberRecruitment,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return '${AppStrings.validate_message_signUp}';
                              }
                            }),
                        TextField(
                            text: AppStrings.signUp_Recruitmentarea,
                            controller: controlr_Recruitmentarea,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return '${AppStrings.validate_message_signUp}';
                              }
                            }),
                        TextField(
                            text: AppStrings.signUp_NameOfStudentGuardian,
                            controller: controlr_NameOfStudentGuardian,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return '${AppStrings.validate_message_signUp}';
                              }
                            }),
                        TextField(
                            text: AppStrings.signUp_JobOfStudentGuardian,
                            controller: controlr_JobOfStudentGuardian,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return '${AppStrings.validate_message_signUp}';
                              }
                            }),
                        TextField(
                            text: AppStrings.signUp_Studentaddress,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.signUp_Gender,
                              style: Theme.of(context).textTheme.displayLarge,
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
                                  valueGender[0] = value.toString();
                                });
                              },
                            ),
                            Text(AppStrings.signUp_Female,style: Theme.of(context).textTheme.bodySmall),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.20,
                            ),
                            Radio<String>(
                              activeColor: ColorManager.primary,
                              value: 'two',
                              groupValue: ChangeGender,
                              onChanged: (value) {
                                setState(() {
                                  isGender = true;
                                  valueGender[0] = value.toString();
                                });
                              },
                            ),
                            Text(AppStrings.signUp_Male,style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.signUp_Nominationcard,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Spacer(),
                            RegisterContainer()
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.signUp_Photograph,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Spacer(),
                            RegisterContainer()
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.signUp_OriginalBirthcertificate,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Spacer(),
                            RegisterContainer()
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.signUp_PhotoIDNumber,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Spacer(),
                            RegisterContainer()
                          ],
                        ),
                        SizedBox(height: 10),
                        Visibility(
                          visible: isGender,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.signUp_2soldiers,
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Spacer(),
                                  RegisterContainer()
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.signUp_6soldiers,
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Spacer(),
                                  RegisterContainer()
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Column( crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextButton(
                              onPressed: () {
                                if (formkey.currentState?.validate() == true) {
                                  AppConstants.navigateTo(context, OnBording());
                                }
                                setState(() {});
                              },
                              child: Text(
                                AppStrings.signUp_Registration,
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
            ],)
          ),
        ),
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
          maxLines: content,
          controller: controller,
          validator: validator,
        ),
      );
}
