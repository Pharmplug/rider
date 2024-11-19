import 'package:flutter/material.dart';
import 'package:pharmplug_rider/constants/app_colors.dart';
import 'package:pharmplug_rider/utils/local_storage.dart';
import 'package:pharmplug_rider/utils/validator.dart';

import '../../components/buttons.dart';
import '../../components/input_field.dart';
import '../../constants/app_font.dart';
import '../../constants/app_images.dart';
import '../../constants/app_routes.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _controller = TextEditingController();

 final Map<String, dynamic> _registerData = {
    'email': '',
    'password': '',
  };

bool passwordVisible = false;
 bool confirmPasswordVisible = false;
  final _registerFormKey = GlobalKey<FormState>();
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
                    "Let's get you started",
                    style: AppFonts.text16Inter
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: _getSize.height * 0.005,
                  ),
                  Text(
                    "Sign into an account",
                    style: AppFonts.text14InterHint,
                  ),
                ],
              ),
              SizedBox(
                height: _getSize.height * 0.05,
              ),
              Form(
                key: _registerFormKey,
                child: Column(
                  children: [
                    CustomInput(
                        hint: "Email Address",
                        label: "Enter Email Address",
                        onChanged: (c) => {},
                        onSaved: (s) => {{_registerData['email'] = s}},
                        validator: Validators.emailValidator,
                        myController:_controller,
                        ),
                    SizedBox(
                      height: _getSize.height * 0.035,
                    ),
                    CustomInput(
                        hint: "Password",
                        label: "Enter Password",
                        obsecure: !passwordVisible,
                        onChanged: (c) => {_registerData['password'] = c},
                        validator: Validators.passwordValidator,
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
                        onSaved: (s) => {_registerData['email'] = s}),
                    SizedBox(
                      height: _getSize.height * 0.02,
                    ),
                   
                    CustomInput(
                        hint: "Confirm Password",
                        label: "Enter Password",
                        obsecure: !confirmPasswordVisible,
                        onChanged: (c) => {},
                        validator: (value){
                          if(value != _registerData['password'] ){
                            return "Password do not match.";
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                            onPressed: () {
                              //call set state so that the UI is rebuilt on click
                              setState(() {
                                //loop through either state when clicked
                                confirmPasswordVisible = !confirmPasswordVisible;
                              });
                            },
                            icon: Icon(
                              // if password visibilty is default false set icon to visible icon or else set to hide icon
                              confirmPasswordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off,
                              color: Pallete.disabledColor, size: 18,
                            )),
                        onSaved: (s) => {}),
                  ],
                ),
              ),
              SizedBox(
                height: _getSize.height * 0.06,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ButtonWithFunction(
                    text: "Continue",
                    onPressed: () {
                        if(_registerFormKey.currentState?.validate() ?? false){
                          _registerFormKey.currentState?.save();

                          // Capture the email from the TextField
                          String email = _controller.text.trim();
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRoutes.registerotpScreen, 
                              arguments: email,
                              (route) => false);
                              saveOnce(2);
                        }
                        }
                          
                        ),
              ),
              SizedBox(
                height: _getSize.height * 0.15,
              ),
              GestureDetector(
                onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.loginScreen);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: AppFonts.text12InterHint,
                    ),
                    Text(
                      "Sign In",
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
