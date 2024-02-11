import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cridet_hour_system/app/cubit/state.dart';
import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:cridet_hour_system/pressentaion/resources/models/important_news_Image_model/important_news_Image_model.dart';
import 'package:cridet_hour_system/pressentaion/resources/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import '../../pressentaion/resources/constants_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../pressentaion/resources/models/courses/courses_model.dart';
import '../../pressentaion/resources/models/last_exam_image_model/last_exam_image_model.dart';
import '../../pressentaion/resources/models/tableImage_model/tableImage_model.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppIniteal());

  static AppCubit get(context) => BlocProvider.of(context);

// App

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

bool isCard =true;

void ChangeCard(index){
  if(index==0){
  isCard = true;
  emit(changeisCardState());
  }if(index==1){
   isCard = false;
   emit(changeisCardState());
  }

}
  //function to upload image
  File? personimage;
  var picker = ImagePicker();

  Future<void> getPersonImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      personimage = File(pickedFile.path);
      StudentImages?.add(personimage!);
      emit(PersonImagePickedSuccsessState());
    } else {
      print('no image selected');
      emit(PersonImagePickedErrorState());
    }
  }

  File? IDImage;

  Future<void> getIDImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      IDImage = File(pickedFile.path);
      StudentImages?.add(IDImage!);
      emit(IDImagePickedSuccsessState());
    } else {
      print('no image selected');
      emit(IDImagePickedErrorState());
    }
  }
  File? NomationImage;

  Future<void> getNomationImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      NomationImage = File(pickedFile.path);
      StudentImages?.add(NomationImage!);
      emit(NomationCardImagePickedSuccsessState());
    } else {
      print('no image selected');
      emit(NomationCardImagePickedErrorState());
    }
  }
  File? BirthCImage;

  Future<void> getBirthCImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      BirthCImage = File(pickedFile.path);
      StudentImages?.add(BirthCImage!);
      emit(BirthCImagePickedSuccsessState());
    } else {
      print('no image selected');
      emit(BirthCImagePickedErrorState());
    }
  }
  File? Soilder2Image;

  Future<void> getSoilder2Image() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Soilder2Image = File(pickedFile.path);
      StudentImages?.add(Soilder2Image!);
      emit(soilder2ImagePickedSuccsessState());
    } else {
      print('no image selected');
      emit(soilder2ImagePickedErrorState());
    }
  }  File? Soilder6Image;
  List<File> StudentImages=[];
  Future<void> getSoldier6Images() async {

      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
         Soilder6Image = File(pickedFile.path);
        print(Soilder6Image);

        StudentImages.add(Soilder6Image!);
        print(StudentImages);

        emit((soilder6ImagePickedSuccsessState()));
      } else {
        print('No image selected');
        emit(soilder6ImagePickedErrorState());
      }

  }



  // Function to register a new user
  void registerWithEmailAndPassword({
    required String email,
    required String password,
    required context,
    required String approvalDate,
    required String band,
    required String bandDivision,
    required String basicStudentData,
    required String birthDayImage,
    required String cardIssuingParty,
    required String dateOfBirth,
    required String  degreeTotal,
    required String  divisionInstitute,
    required String doneIn,
    required String educationalQualification,
    required String fatherJob,
    required String fatherName,
    required String gender,
    required double gpa,
    required String guardianPhone,
    required String idCardNumber,
    required String idPhoto,
    required String image,
    required bool military,
    required String name,
    required String nominationCard,
    required String observance,
    required String orderStatus,
    required String partyTransferred,
    required String phone,
    required String photograph,
    required String placeBirth,
    required String receivedData,
    required String recruitmentArea,
    required String schoolName,
    required String schoolYear,
    required String sittingNumber,
    required String studentAddress,
    required String studentPhone,
    required String soldiers_image_1,
    required String soldiers_image_2,
    required bool? enrollmentStatus,
    required String transferStatus,
    required String transferType,
    required String tripleNumber,
    required List<File> Images,
  }) async {
    emit(RegisterLosingState());
    try {
      // Create user in Firebase Authentication
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String uid = result.user!.uid;
      emit(UpdateImagesLoadingState());

      List<Future<String>> uploadTasks = [];

      for (int i = 0; i < Images.length; i++) {
        File image = Images[i];

        uploadTasks.add(
          FirebaseStorage.instance
              .ref()
              .child('student/$uid/images/${DateTime.now().millisecondsSinceEpoch}_$i.jpg')
              .putFile(image)
              .then((value) => value.ref.getDownloadURL())
              .catchError((error) {
            emit(UpdateImagesErrorState());
            return null;
          }),
        );
      }
      List<String?> FinalImagesURL =[] ;
      Future.wait(uploadTasks).then((List<String?> downloadUrls) async{
        // Filter out any null values in case of errors during upload
        downloadUrls = downloadUrls.where((url) => url != null).cast<String>().toList();

        if (downloadUrls.isNotEmpty) {
          FinalImagesURL.addAll(downloadUrls);
          emit(UpdateImagesSuccsesState());
          print(downloadUrls);
          Student_Model userData = Student_Model(
              password: password,
              email: email,logOut: false,
              isPaid: false,
              id: uid,
              soldiers_image_1: downloadUrls[4],
              soldiers_image_2: downloadUrls[5],
              absence: {},
              approvalDate: approvalDate,
              band: band,
              bandDivision: bandDivision,
              basicStudentData: basicStudentData,
              birthDayImage: downloadUrls[3],
              bookList: [],
              cardIssuingParty: cardIssuingParty,
              dateOfBirth: dateOfBirth,
              degreeTotal: degreeTotal,
              divisionInstitute: divisionInstitute,
              doneIn: doneIn,
              educationalQualification: educationalQualification,
              enrollmentStatus: enrollmentStatus,
              fatherJob: fatherJob,
              fatherName: fatherName,
              gender: gender,
              gpa: gpa,
              guardianPhone: guardianPhone,
              idCardNumber: idCardNumber,
              idPhoto: downloadUrls[2],
              image: downloadUrls[0],
              level: 'First Garde',
              military: military,
              name: name,
              nominationCard: nominationCard,
              observance: observance,
              orderStatus: orderStatus,
              partyTransferred: partyTransferred,
              phone: phone,
              photograph: downloadUrls[1],
              placeBirth: placeBirth,
              receivedData: receivedData,
              recruitmentArea: recruitmentArea,
              schoolName: schoolName,
              schoolYear: schoolYear,
              isApproved: false,
              sittingNumber: sittingNumber,
              studentAddress: studentAddress,
              studentPhone: studentPhone,
              transferStatus: transferStatus,
              transferType: transferType,
              tripleNumber: tripleNumber,
              warning: [], levelar: 'الفرقة الاولى');
          // Get the UID of the newly registered user

          // Save additional user data to Firestore
          await _firestore
              .collection('students')
              .doc(uid)
              .set(userData.toJson())
              .then((value) {
            StudentImages =[];
            emit(RegisterSuccesState());
          }).catchError((e){
            emit(RegisterErrorState());
            if (e is FirebaseAuthException) {
              if (e.code == 'email-already-in-use') {
                // Show a Snackbar when the email is already in use

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: ColorManager.error,
                    content: Text(
                        textAlign: TextAlign.center,
                        'Email Is Aleardy Exist',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white)),
                    duration: Duration(seconds: 3), // Adjust the duration as needed
                  ),
                );
              } else if (e.code == 'too-many-requests') {
                // Show a Snackbar when the password is incorrect

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: ColorManager.error,
                    content: Text(
                        textAlign: TextAlign.center,
                        'To Many Request ',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white)),
                    duration: Duration(seconds: 3), // Adjust the duration as needed
                  ),
                );
              } else if (e.code == 'weak-password') {
                // Show a Snackbar when the password is too weak
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: ColorManager.error,
                    content: Text(
                        textAlign: TextAlign.center,
                        'Weak Password',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white)),
                    duration: Duration(seconds: 3), // Adjust the duration as needed
                  ),
                );
              } else {
                // Handle other FirebaseAuth errors
                print('FirebaseAuth error during user sign-up: ${e.message}');
              }
            } else if (e is FirebaseException && e.code == 'network-request-failed') {
              // Show a Snackbar for network/connection error
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: ColorManager.error,
                  content: Text(
                      textAlign: TextAlign.center,
                      'Check Your Conection',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white)),
                  duration: Duration(seconds: 3), // Adjust the duration as needed
                ),
              );
            } else {
              // Handle other errors
              print('Error during user sign-up: $e');
            }
          });


        } else {
          emit(UpdateImagesErrorState());
        }
      }).catchError((error) {
        emit(UpdateImagesErrorState());
      });


     // Return null if registration is successful
    } on FirebaseAuthException catch (e) {
      //   // Return an error message if registration fails
      emit(RegisterErrorState());
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          // Show a Snackbar when the email is already in use

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: ColorManager.error,
              content: Text(
                  textAlign: TextAlign.center,
                  'Email Is Aleardy Exist',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white)),
              duration: Duration(seconds: 3), // Adjust the duration as needed
            ),
          );
        } else if (e.code == 'too-many-requests') {
          // Show a Snackbar when the password is incorrect

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: ColorManager.error,
              content: Text(
                  textAlign: TextAlign.center,
                  'To Many Request ',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white)),
              duration: Duration(seconds: 3), // Adjust the duration as needed
            ),
          );
        } else if (e.code == 'weak-password') {
          // Show a Snackbar when the password is too weak
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: ColorManager.error,
              content: Text(
                  textAlign: TextAlign.center,
                  'Weak Password',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white)),
              duration: Duration(seconds: 3), // Adjust the duration as needed
            ),
          );
        } else {
          // Handle other FirebaseAuth errors
          print('FirebaseAuth error during user sign-up: ${e.message}');
        }
      } else if (e is FirebaseException && e.code == 'network-request-failed') {
        // Show a Snackbar for network/connection error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: ColorManager.error,
            content: Text(
                textAlign: TextAlign.center,
                'Check Your Conection',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white)),
            duration: Duration(seconds: 3), // Adjust the duration as needed
          ),
        );
      } else {
        // Handle other errors
        print('Error during user sign-up: $e');
      }
      throw e;
    }
  }

  // Function to log in with email and password
  void signInWithEmailAndPassword(
      {required String email,
      required String password,
      required context}) async {
    emit(SignInLosingState());
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        emit(SignInSuccesState());
        getUserData();
        _firestore.collection('students').doc(value?.user?.uid).update(
            {
              'logOut': false,
            }
        ).then((value) {
          getUserData();
        }).catchError((e){
          print(e.toString());
          emit(SignInErrorState());
        });

      });
      // Return null if login is successful
    } on FirebaseAuthException catch (e) {
      emit(SignInErrorState());
      print(e.message); // Return an error message if login fails

      if (e is FirebaseAuthException) {
        print(e.code);
        if (e.code == 'user-not-found') {
          // Show a Snackbar when email is not found
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: ColorManager.error,
              content: Text(
                  textAlign: TextAlign.center,
                  'Email Not Exist',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white)),
              duration: Duration(seconds: 3), // Adjust the duration as needed
            ),
          );
        } else if (e.code == 'wrong-password') {
          // Show a Snackbar when the password is incorrect
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: ColorManager.error,
              content: Text(
                  textAlign: TextAlign.center,
                  'Wrong Password',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white)),
              duration: Duration(seconds: 3), // Adjust the duration as needed
            ),
          );
        } else if (e.code == 'invalid-credential') {
          // Show a Snackbar when the password is incorrect
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: ColorManager.error,
              content: Text(
                  textAlign: TextAlign.center,
                  'Wrong Password OR Email',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white)),
              duration: Duration(seconds: 3), // Adjust the duration as needed
            ),
          );
        } else if (e.code == 'too-many-requests') {
          // Show a Snackbar when the password is incorrect
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: ColorManager.error,
              content: Text(
                  textAlign: TextAlign.center,
                  'You Tryed Many Times Wait Coubl Of Minuts To Try Again',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white)),
              duration: Duration(seconds: 3), // Adjust the duration as needed
            ),
          );
        } else {
          // Handle other FirebaseAuth errors
          print('FirebaseAuth error during user sign-in: ${e.message}');
        }
      } else if (e is FirebaseException && e.code == 'network-request-failed') {
        // Show a Snackbar for network/connection error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: ColorManager.error,
            content: Text(
                textAlign: TextAlign.center,
                'Check Your Network Conection ',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white)),
            duration: Duration(seconds: 3), // Adjust the duration as needed
          ),
        );
      } else {
        // Handle other errors
        print('Error during user sign-in: $e');
      }
    }
  }


  Student_Model? student_model;
  // Function to get user data from Firestore
  void getUserData() async {
    emit(getUserLoadingState());
    print('get data');
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        print('${user.uid}');
        DocumentSnapshot<Map<String, dynamic>> snapshot =
            await _firestore.collection('students').doc(user.uid).get();

        if (snapshot.exists) {
          student_model = Student_Model.fromJson(snapshot.data()!);
          print(student_model?.email);
          print(snapshot.data());
          emit(getUserSuccsesState());
          // If the document exists, create a Student object from the data
        } else {
          emit(getUserErrorState());
          print('doc not exist');
          return null; // Return null if the document does not exist
        }
      } else {
        emit(getUserErrorState());
        print('no user log in');
        return null; // Return null if no user is logged in
      }
    } catch (e) {
      emit(getUserErrorState());
      print(e.toString());
      return null; // Return null in case of an error
    }
  }

  void PayUser(){
   emit(PayLoadingState());
   User? user = _auth.currentUser;
   _firestore.collection('students').doc(user?.uid).update(
     {
       'isPaid': true,
     }
   ).then((value) {
     getUserData();
     emit(PaySuccsesState());
   }).catchError((e){
     emit(PayErrorState());
     print(e.toString());
   });
  }

  List<Courses_Model> CourseLinkList = [

  ];

  Future<void> GetCousrsData({required context}) async {
    CourseLinkList = [];

    emit(GetCourseModelLoadingState());
    print('get Cousrs data');
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await _firestore.collection('Courses').get();

      CourseLinkList = querySnapshot.docs
          .map((DocumentSnapshot<Map<String, dynamic>> element) =>
          Courses_Model.fromJson(element.data()!))
          .toList();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorManager.green,
          content: Text(
              textAlign: TextAlign.center,
              'GET Success ',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white)),
          duration: Duration(seconds: 3), // Adjust the duration as needed
        ),
      );
      emit(GetCourseModelSuccsesState());
    } catch (e) {
      print(e.toString());
      emit(GetCourseModelErrorState());
    }
  }

  List<Table_Image_Model> tableImages =[];

  Future<void> GetTableImages({required context,required grade}) async {
    tableImages = [];


    emit(Get_tablesLoadingState());
    print('get tabel iamge');
    try {
      var map = await _firestore.collection("Table_Images").get();
      map.docs.forEach((element) {
        if(element.data()['grade']==grade)
        tableImages.add(Table_Image_Model.fromJson(element.data()));
      });
      print(tableImages);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorManager.green,
          content: Text(
              textAlign: TextAlign.center,
              'GET Succes ',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white)),
          duration: Duration(seconds: 3), // Adjust the duration as needed
        ),
      );
      emit(Get_tablesSuccsesState());
    } catch (e) {
      print(e.toString());
      emit(Get_tablesErrorState());
      return null; // Return null in case of an error
    }
  }
  Future<void> download_Image({imageUrl, context}) async {
    emit(Download_Image_LodingState());
    try {
      http.Response response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        // Convert the response body to Uint8List (bytes)
        Uint8List bytes = response.bodyBytes;

        // Compress the image
        List<int> compressedBytes = await FlutterImageCompress.compressWithList(
          bytes,
          minHeight: 1920,
          minWidth: 1080,
          quality: 95,
        );

        // Save the compressed image to the gallery
        final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(compressedBytes),
          name: 'Cridet_Hour_System_Images', // Optional: Provide a custom album name
        );

        if (result != null) {
          // Image saved successfully
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Download completed successfully',
              ),
              backgroundColor: Colors.green,
            ),
          );
          emit(Download_Image_SuccessState());
          print('Image saved to gallery! Path: $result');
        } else {
          // Error occurred while saving the image
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Download Error'), backgroundColor: Colors.red),
          );
          emit(Download_Image_ErrorState());
          print('Error saving image to gallery.');
        }
      } else {
        emit(Download_Image_ErrorState());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('We have a problem right now'),
              backgroundColor: Colors.red),
        );
        // Handle API error
        print('API Error: ${response.statusCode}');
      }
    } catch (e) {
      // Handle other errors
      emit(Download_Image_ErrorState());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('We have a problem right now'),
            backgroundColor: Colors.red),
      );
      print('Error: $e');
    }
  }
  List<ImportantNews_Image_Model> ImportantNewsImages =[];

  Future<void> GetImportantNewsImages({required context,required grade}) async {
    ImportantNewsImages = [];


    emit(Get_ImportantNews_LoadingState());
    print('get imprtant iamge');
    try {
      var map = await _firestore.collection("ImportantNews_Images").get();
      map.docs.forEach((element) {
        if(element.data()['grade']==grade)
        ImportantNewsImages.add(ImportantNews_Image_Model.fromJson(element.data()));
      });
      print(ImportantNewsImages);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorManager.green,
          content: Text(
              textAlign: TextAlign.center,
              'GET Succes ',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white)),
          duration: Duration(seconds: 3), // Adjust the duration as needed
        ),
      );
      emit(Get_ImportantNews_SuccsesState());
    } catch (e) {
      print(e.toString());
      emit(Get_ImportantNews_ErrorState());
      return null; // Return null in case of an error
    }
  }
  List<Last_Exam_Image_Model> last_examImages =[];

  Future<void> Get_LastExam_Images({required context,required grade}) async {
    last_examImages = [];


    emit(Get_Last_Exam_LoadingState());
    print('get imprtant iamge');
    try {
      var map = await _firestore.collection("Last_Exam_Images").get();
      map.docs.forEach((element) {
        if(element.data()['grade']==grade)
          last_examImages.add(Last_Exam_Image_Model.fromJson(element.data()));
      });
      print(last_examImages);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorManager.green,
          content: Text(
              textAlign: TextAlign.center,
              'GET Succes ',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white)),
          duration: Duration(seconds: 3), // Adjust the duration as needed
        ),
      );
      emit(Get_Last_Exam_SuccsesState());
    } catch (e) {
      print(e.toString());
      emit(Get_Last_Exam_ErrorState());
      return null; // Return null in case of an error
    }
  }

}
