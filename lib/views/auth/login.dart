import 'package:flutter/material.dart';
import 'package:pharmplug_rider/components/input_field.dart';
import 'package:pharmplug_rider/constants/app_colors.dart';
import 'package:pharmplug_rider/constants/app_font.dart';

import '../../components/buttons.dart';
import '../../constants/app_images.dart';
import '../../constants/app_routes.dart';
import '../../utils/auth_utils/login_util.dart';
import '../../utils/validator.dart';
import '../dashboard/dashboard.dart';
import '../navbar/nav.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordVisible = false;
  bool remember = false;
  final _loginFormKey = GlobalKey<FormState>();
  bool obsecure = true;
  var name = "Solomon";
  bool enabled = false;
  bool isSpecialAdded = false;
  bool isNumAdded = false;
  bool isAboveEight = false;

  void _checkPasswordStrength(String value) {
    dynamic password = value.trim();
    setState(() {
      if (Validators.numReg.hasMatch(password)) {
        // Password has number
        isNumAdded = true;
      } else {
        isNumAdded = false;
      }
      if (Validators.specialReg.hasMatch(password)) {
        // Password has a special character
        isSpecialAdded = true;
      } else {
        isSpecialAdded = false;
      }

      if (password.length > 8) {
        // Password is more than 8
        isAboveEight = true;
      } else {
        isAboveEight = false;
      }
      if (isSpecialAdded && isNumAdded && isAboveEight) {
        enabled = true;
      } else {
        enabled = false;
      }
    });
  }

  final Map<String, dynamic> _loginData = {
    'email': '',
    'password': '',
  };
  @override
  Widget build(BuildContext context) {
    final _getSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: _getSize.height * 0.05,
              ),
              Center(
                child: Image.asset(
                  AppImages.logo,
                  width: _getSize.width * 0.4,
                ),
              ),
              SizedBox(
                height: _getSize.height * 0.05,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let's Sign you in",
                    style: AppFonts.text16Inter
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: _getSize.height * 0.005,
                  ),
                  Text(
                    "Welcome back",
                    style: AppFonts.text14InterHint,
                  ),
                ],
              ),
              SizedBox(
                height: _getSize.height * 0.05,
              ),
              Form(
                key: _loginFormKey,
                child: Column(
                  children: [
                    CustomInput(
                        hint: "Email Address",
                        validator: Validators.emailValidator,
                        label: "Enter Email Address",
                
                        onSaved: (s) => {_loginData['email'] = s}),
                    SizedBox(
                      height: _getSize.height * 0.035,
                    ),
                    CustomInput(
                        hint: "Password",
                        label: "Enter Password",
                        obsecure: !passwordVisible,
                        onChanged: (c) {
                          _checkPasswordStrength(c!);
                          if (enabled) {
                            _loginData['password'] = c;
                          }
                        },
                        suffixIcon: IconButton(
                            onPressed: () {
                              //call set state so that the UI is rebuilt on click
                              setState(() {
                                //loop through either state when clicked
                                passwordVisible = !passwordVisible;
                              });
                            },
                            icon: Icon(
                              // if password visibilty is default false set icon to visible icon or else set to hide icon
                              passwordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off,
                              color: Pallete.disabledColor, size: 18,
                            )),
                        onSaved: (s) => {
                              _loginData['password'] = s
                        }),
                    SizedBox(
                      height: _getSize.height * 0.02,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Pallete.primaryColor,
                          side: BorderSide(width: 0.2, color: Pallete.text),
                          value: remember,
                          onChanged: (c) => {
                                //call set state so that the UI is rebuilt on click
                                setState(() {
                                  //loop through either state when clicked
                                  remember = c!;
                                })
                              }),
                      Text(
                        "Remember",
                        style: AppFonts.text12InterHint,
                      )
                    ],
                  ),
                  GestureDetector(
                      onTap: () => {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.forgotPassword)
                          },
                      child: Text(
                        "Forgot Password?",
                        style: AppFonts.text14InterGreen,
                      ))
                ],
              ),
              SizedBox(
                height: _getSize.height * 0.06,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ButtonWithFunction(
                    text: "Sign in",
                    onPressed: () => {
                     if(_loginFormKey.currentState?.validate() ?? false){
                          _loginFormKey.currentState?.save(),
                          
                          LoginUtil.login(_loginFormKey, context, _loginData)
                     }
                        }),
              ),
              SizedBox(
                height: _getSize.height * 0.15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.registerScreen);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: AppFonts.text12InterHint,
                    ),
                    Text(
                      "Sign Up",
                      style: AppFonts.text14InterGreen,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
