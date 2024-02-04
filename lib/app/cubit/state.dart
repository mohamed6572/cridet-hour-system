
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