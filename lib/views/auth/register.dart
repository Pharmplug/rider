import 'package:flutter/material.dart';
import 'package:pharmplug_rider/constants/app_colors.dart';
import 'package:pharmplug_rider/utils/auth_utils/register_util.dart';
import 'package:pharmplug_rider/utils/local_storage.dart';
import 'package:pharmplug_rider/utils/validator.dart';
import '../../provider/auth_provider.dart';
import '../../components/buttons.dart';
import '../../components/input_field.dart';
import '../../constants/app_font.dart';
import '../../constants/app_images.dart';
import '../../constants/app_routes.dart';
import '../../utils/app_utils.dart';
import 'package:provider/provider.dart';

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
    'confirmPassword': '',
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
                        onChanged: (c) => _registerData['email'] = c,
                        onSaved: (s) => _registerData['email'] = s,
                        validator: Validators.emailValidator,
                        myController: _controller,
                      ),
                      SizedBox(
                        height: _getSize.height * 0.035,
                      ),
                      CustomInput(
                          hint: "Password",
                          label: "Enter Password",
                          obsecure: !passwordVisible,
                          onChanged: (c) => _registerData['password'] = c,
                          validator: Validators.passwordValidator,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            icon: Icon(
                              passwordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off,
                              color: Pallete.disabledColor,
                              size: 18,
                            ),
                          ),
                          onSaved: (s) => {_registerData['password'] = s}),
                      SizedBox(
                        height: _getSize.height * 0.02,
                      ),
                      CustomInput(
                          hint: "Confirm Password",
                          label: "Enter Password",
                          obsecure: !confirmPasswordVisible,
                          onChanged: (c) {
                            _registerData['confirmPassword'] = c;
                          },
                          validator: (value) {
                            if (value != _registerData['password']) {
                              return "Passwords do not match.";
                            } else {
                              return null;
                            }
                          },
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                confirmPasswordVisible =
                                    !confirmPasswordVisible;
                              });
                            },
                            icon: Icon(
                              confirmPasswordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off,
                              color: Pallete.disabledColor,
                              size: 18,
                            ),
                          ),
                          onSaved: (s) =>
                              {_registerData['confirmPassword'] = s}),
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
                      RegisterUtil.register(
                          _registerFormKey, context, _registerData);
                    },
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
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
