import 'package:cridet_hour_system/app/cubit/cubit.dart';
import 'package:cridet_hour_system/app/cubit/state.dart';
import 'package:cridet_hour_system/pressentaion/UI/App/Home/home_screen.dart';
import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:cridet_hour_system/pressentaion/resources/constants_manager.dart';
import 'package:cridet_hour_system/pressentaion/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/custom_widgets/custom_widget.dart';
import '../Register/register.dart';
import '../payment/payments_details.dart';
import '../waitingScreen/waiting_screen.dart';
import 'Text_form_field.dart';

class Login_screen extends StatefulWidget {
  static const String routeName = 'Login_screen';

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  var formKey = GlobalKey<FormState>();
  var mailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is SignInSuccesState && state is getUserSuccsesState) {
          AppCubit.get(context).student_model?.isApproved == false ?  AppConstants.navigateTo(context,WaitingScreen()) : AppCubit.get(context).student_model?.isPaid == false ?
          AppConstants.navigateTo(context,PaymentsDetailsView()):AppConstants.navigateToAndFinish(context,HomeScreen());



          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Login Succses Going To Waiting ...',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white
                ),
              ),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: ColorManager.backGround,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorManager.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 7,
                              color: ColorManager.grey)
                        ]),
                    width: 420,
                    height: mediaquery(context).height * 0.6,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Login',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                              ],
                            ),
                          ),
                          Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                def_TextFormField(
                                  onTapOutside: (event) {
                                    FocusScope.of(context).unfocus();
                                  },
                                  hintText: 'Enter Your Email',
                                  horizontal: 20.0,
                                  virtical: 10.0,
                                  controller: mailController,
                                  context: context,
                                  maxLines: 1,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'please Enter Email Address';
                                    }
                                    bool emailValid = RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value);
                                    if (!emailValid) {
                                      return 'please enter valid email';
                                    }
                                    return null;
                                  },
                                ),
                                def_TextFormField(
                                  isPassword: isObscure,
                                  onTapOutside: (event) {
                                    FocusScope.of(context).unfocus();
                                  },
                                  hintText: 'Password',
                                  suffix: isObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  passwordShow: () {
                                    if (isObscure) {
                                      setState(() {
                                        isObscure = false;
                                      });
                                    } else {
                                      setState(() {
                                        isObscure = true;
                                      });
                                    }
                                  },
                                  horizontal: 20.0,
                                  virtical: 10.0,
                                  controller: passwordController,
                                  context: context,
                                  maxLines: 1,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'please Enter Password';
                                    }
                                    if (value.length < 6) {
                                      return 'password should be at least 6 character';
                                    }
                                    return null;
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              'Forget password?',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: TextButton(
                                onPressed: () {

                                  if (formKey.currentState!.validate()) {
                                    cubit.signInWithEmailAndPassword(
                                        email: mailController.text,
                                        context: context,
                                        password: passwordController.text);
                                  }
                                },
                                child:state is SignInLosingState ? Center(child: CircularProgressIndicator(color: ColorManager.white,),) : Text(
                                  'Login',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: ColorManager.white),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Text(
                                  "Don't have account?",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                InkWell(
                                  onTap: () {
                                    AppConstants.navigateTo(
                                        context, Register());
                                  },
                                  child: Text('Register now!',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: ColorManager.primary)),
                                )
                              ],
                            ),
                          )
                        ],
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
