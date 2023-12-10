import 'package:cridet_hour_system/pressentaion/UI/Text_form_field.dart';
import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:cridet_hour_system/pressentaion/resources/font_manager.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: ColorManager.white2,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height:30,
              ),
              Image.asset(
                'assets/images/logo.png',
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorManager.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0,1),
                          blurRadius: 7,
                          color: ColorManager.grey)
                    ]),
                width: 420,
                height: 450,
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
                          textFormField(
                            controller: mailController,
                            hintText: 'Enter Your Email',
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'please Enter Email Address';
                              }
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(text);
                              if (!emailValid) {
                                return 'please enter valid email';
                              }
                              return null;
                            },
                          ),
                          textFormField(
                            hintText: 'Password',
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'please Enter Password';
                              }
                              if (text.length < 6) {
                                return 'password should be at least 6 character';
                              }
                              return null;
                            },
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            isObscure: isObscure,
                            suffixIcon: InkWell(
                              child: isObscure
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onTap: () {
                                if (isObscure) {
                                  isObscure = false;
                                } else {
                                  isObscure = true;
                                }
                                setState(() {});
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Forget password?',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {}
                          },
                          child: Text(
                            'Login',
                            style: Theme.of(context).textTheme.bodySmall,
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
                          Text('Register now!',
                              style: Theme.of(context).textTheme.displayMedium)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
