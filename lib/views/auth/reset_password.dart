import 'package:flutter/material.dart';
import 'package:pharmplug_rider/utils/auth_utils/reset_password_util.dart';

import '../../components/buttons.dart';
import '../../components/input_field.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_font.dart';
import '../../constants/app_images.dart';
import '../../constants/app_routes.dart';
import 'package:pharmplug_rider/utils/validator.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  bool passwordVisible = false;
 bool confirmPasswordVisible = false;
  final _registerFormKey = GlobalKey<FormState>();

  final Map<String, dynamic> _resetData = {
    'password': '',
    'confirmPassword': ''
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
                    "Enter New Password",
                    style: AppFonts.text16Inter
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: _getSize.height * 0.005,
                  ),
                  Text(
                    "Enter a new password",
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
                        hint: "Password",
                        label: "Enter Password",
                        obsecure: !passwordVisible,
                        onChanged: (c) => {},
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
                        onSaved: (s) => {_resetData['password'] = s}),
                    SizedBox(
                      height: _getSize.height * 0.02,
                    ),
                   
                    CustomInput(
                        hint: "Confirm Password",
                        label: "Enter Password",
                        obsecure: !confirmPasswordVisible,
                        onChanged: (c) => {},
                        //  validator: (value) {
                        //     if (value != _resetData['password']) {
                        //       return "Passwords do not match.";
                        //     } else {
                        //       return null;
                        //     }
                        //   },
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
                        onSaved: (s) => {_resetData['confirmPassword'] = s}),
                  ],
                ),
              ),
              SizedBox(
                height: _getSize.height * 0.35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ButtonWithFunction(
                    text: "Saved Changes",
                    onPressed: () => {
                     if(_registerFormKey.currentState?.validate() ?? false){
                          _registerFormKey.currentState?.save(),
                          
                          ResetPasswordUtil.resetPassword(_registerFormKey, context, _resetData)
                     }
                        }),
              ),
          ],
          ),
        ),
      )),
    );
  }
}

