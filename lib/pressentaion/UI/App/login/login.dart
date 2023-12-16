import 'package:cridet_hour_system/pressentaion/UI/App/Home/home_screen.dart';
import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:cridet_hour_system/pressentaion/resources/constants_manager.dart';
import 'package:cridet_hour_system/pressentaion/resources/font_manager.dart';
import 'package:flutter/material.dart';

import '../../../resources/custom_widgets/custom_widget.dart';
import '../Register/register.dart';
import '../payment/payments_details.dart';
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
                height: mediaquery(context).height*0.6,
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
                                style: Theme.of(context).textTheme.bodyLarge),
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
                            def_TextFormField(isPassword: true,
                              onTapOutside: (event) {
                                FocusScope.of(context).unfocus();
                              },
                              hintText: 'Password',suffix:isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility ,
                             passwordShow:    () {
                    if (isObscure) {
                    isObscure = false;
                    } else {
                    isObscure = true;
                    }
                    setState(() {});
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
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                        child: TextButton(
                            onPressed: () {
                              AppConstants.navigateTo(context, PaymentsDetailsView());
                              // if (formKey.currentState!.validate()) {}
                            },
                            child: Text(
                              'Login',
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorManager.white),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Text(
                              "Don't have account?",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            InkWell(
                              onTap: (){
                                AppConstants.navigateTo(context, Register());
                              },
                              child: Text('Register now!',
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorManager.primary)),
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
  }
}
