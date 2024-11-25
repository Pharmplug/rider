import 'package:flutter/material.dart';

import '../../components/buttons.dart';
import '../../components/input_field.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_font.dart';
import '../../constants/app_images.dart';
import '../../constants/app_routes.dart';
import '../../utils/auth_utils/forgot_password_util.dart';
import '../../utils/validator.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _forgotPasswordFormKey = GlobalKey<FormState>();
  bool enabled = false;

  final Map<String, dynamic> _forgotPasswordData = {
    'email': '',
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
                    "Forgot Password?",
                    style: AppFonts.text16Inter
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: _getSize.height * 0.005,
                  ),
                  Text(
                    "Enter your email address to receive an OTP to reset your password.",
                    style: AppFonts.text14InterHint,
                  ),
                ],
              ),
              SizedBox(
                height: _getSize.height * 0.05,
              ),
              Form(
                key: _forgotPasswordFormKey,
                child: Column(
                  children: [
                    CustomInput(
                        validator: Validators.emailValidator,
                        hint: "Email Address",
                        label: "Enter Email Address",
                        onChanged: (c) => {},
                        onSaved: (s) => {
                              _forgotPasswordData['email'] =
                                  s!.trim().split(' ').join('')
                            }),
                    SizedBox(
                      height: _getSize.height * 0.035,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: _getSize.height * 0.35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ButtonWithFunction(
                    text: "Reset Password",
                    onPressed: () => {
                      if(_forgotPasswordFormKey.currentState?.validate() ?? false) {
                        _forgotPasswordFormKey.currentState?.save(),// Save form values
                        ForgotPasswordUtil.forgotPassword(_forgotPasswordFormKey, context, _forgotPasswordData)
                      }
                    })
              ),
            ],
          ),
        ),
      )),
    );
  }
}
