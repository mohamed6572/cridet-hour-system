
abstract class AppState {}

class AppIniteal extends AppState {}

//Sign IN
class SignInSuccesState extends AppState {}
class SignInLosingState extends AppState {}
class SignInErrorState extends AppState {}

// Register
class RegisterSuccesState extends AppState {}
class RegisterLosingState extends AppState {}
class RegisterErrorState extends AppState {}
//upload image
//person
class PersonImagePickedErrorState extends AppState {}
class PersonImagePickedSuccsessState extends AppState {}
//nomation
class NomationCardImagePickedSuccsessState extends AppState {}
class NomationCardImagePickedErrorState extends AppState {}
//ID
class IDImagePickedSuccsessState extends AppState {}
class IDImagePickedErrorState extends AppState {}
//BirthC
class BirthCImagePickedSuccsessState extends AppState {}
class BirthCImagePickedErrorState extends AppState {}
//soilder2
class soilder2ImagePickedSuccsessState extends AppState {}
class soilder2ImagePickedErrorState extends AppState {}
//soilder6
class soilder6ImagePickedSuccsessState extends AppState {}
class soilder6ImagePickedErrorState extends AppState {}
//upload images
class UpdateImagesLoadingState extends AppState {}
class UpdateImagesSuccsesState extends AppState {}
class UpdateImagesErrorState extends AppState {}
class getUserLoadingState extends AppState {}
class getUserSuccsesState extends AppState {}
class getUserErrorState extends AppState {}
//card state
class changeisCardState extends AppState {}
//paid
class PayLoadingState extends AppState {}
class PaySuccsesState extends AppState {}
class PayErrorState extends AppState {}
class GetCourseModelLoadingState extends AppState {}
class GetCourseModelSuccsesState extends AppState {}
class GetCourseModelErrorState extends AppState {}
class SignOutLoadingState extends AppState {}
class SignOutSuccsesState extends AppState {}
class SignOutErrorState extends AppState {}
//upload image table

class Upload_tablesLoadingState extends AppState {}
class Upload_tablesSuccsesState extends AppState {}
class Upload_tablesErrorState extends AppState {}
//get image table

class Get_tablesLoadingState extends AppState {}
class Get_tablesSuccsesState extends AppState {}
class Get_tablesErrorState extends AppState {}
//delete table image

class Delete_tablesLoadingState extends AppState {}
class Delete_tablesSuccsesState extends AppState {}
class Delete_tablesErrorState extends AppState {}

//download image

class Download_Image_LodingState extends AppState{}
class Download_Image_SuccessState extends AppState{}
class Download_Image_ErrorState extends AppState{}



class Get_Last_Exam_LoadingState extends AppState {}
class Get_Last_Exam_SuccsesState extends AppState {}
class Get_Last_Exam_ErrorState extends AppState {}


//get image last exam

class Get_ImportantNews_LoadingState extends AppState {}
class Get_ImportantNews_SuccsesState extends AppState {}
class Get_ImportantNews_ErrorState extends AppState {}

//get first grade subject

class GetSubject_firstGrad_LoadingState extends AppState {}
class GetSubject_firstGrad_SuccsesState extends AppState {}
class GetSubject_firstGrad_ErrorState extends AppState {}

//get all subject

class GetSubject_All_LoadingState extends AppState {}
class GetSubject_All_SuccsesState extends AppState {}
class GetSubject_All_ErrorState extends AppState {}
//update  subject

class UpdateSubject_LoadingState extends AppState {}
class UpdateSubject_SuccsesState extends AppState {}
class UpdateSubject_ErrorState extends AppState {}

class Get_absence_LoadingState extends AppState {}
class Get_absence_SuccsesState extends AppState {}
class Get_absence_ErrorState extends AppState {}
class CalculateGPAState extends AppState {}

//get grades

class getResult_LoadingState extends AppState {}
class getResult_SuccsesState extends AppState {}
class getResult_ErrorState extends AppState {}