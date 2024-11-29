import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otp_text_field/style.dart';
import 'package:pharmplug_rider/components/buttons.dart';
import 'package:pharmplug_rider/constants/app_colors.dart';
import 'package:pharmplug_rider/constants/app_font.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:pharmplug_rider/utils/auth_utils/register_otp_util.dart';
import 'package:pharmplug_rider/utils/local_storage.dart';
import '../../constants/app_images.dart';
import '../../constants/app_routes.dart';
import 'package:provider/provider.dart';
import '../../provider/auth_provider.dart';

class RegisterOTP extends StatefulWidget {
  const RegisterOTP({Key? key}) : super(key: key);

  @override
  State<RegisterOTP> createState() => _RegisterOTPState();
}

class _RegisterOTPState extends State<RegisterOTP> {
  var email = '';
  int _resend = 20;
  late Timer _timer;
  // int _resendCount = 0;
  var otp = "";
  final String correctOtp = "";

  @override
  void initState() {
    super.initState();
    resendCodeCountdown();
  }

  void resendCodeCountdown() async {
    email = await showEmail();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_resend == 0) {
        _timer.cancel();
      } else {
        _resend--;
        setState(() {});
      }
    });
  }

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
            mainAxisAlignment: MainAxisAlignment.start,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Email Verification Code",
                    style: AppFonts.text16Inter,
                  ),
                  SizedBox(
                    height: _getSize.height * 0.012,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text:
                            "We have sent a mail with a 6-digit activation code to your email address",
                        style: AppFonts.text14InterHint),
                    TextSpan(text: "(", style: AppFonts.text14InterHint),
                    TextSpan(text: email, style: AppFonts.text14InterGreen),
                    TextSpan(text: ")", style: AppFonts.text14InterHint),
                  ])),
                  SizedBox(
                    height: _getSize.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Resend code in ",
                            style: AppFonts.text14InterHint.copyWith(),
                          ),
                          Text(
                            "$_resend",
                            style: AppFonts.text14InterGreen
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      _resend == 0
                          ? GestureDetector(
                              onTap: () {
                                // Resend code action
                                setState(() {
                                  _resend = 20; // Reset the countdown
                                });
                                resendCodeCountdown();
                              },
                              child: Text(
                                "Resend",
                                style: AppFonts.text14InterGreen.copyWith(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Pallete.secondaryColor,
                                  color: _resend == 0
                                      ? Pallete.secondaryColor
                                      : Colors.grey,
                                ),
                              ),
                            )
                          : SizedBox.shrink()
                    ],
                  )
                ],
              ),
              SizedBox(
                height: _getSize.height * 0.1,
              ),
              OTPTextField(
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 45,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 10,
                  style: AppFonts.text14Inter,
                  onChanged: (pin) {
                    setState(() {
                      otp = pin;
                    });
                  },
                  onCompleted: (pin) {}),
              SizedBox(
                height: _getSize.height * 0.1,
              ),
              ButtonWithFunction(
                  text: "Verify Email Address",
                  onPressed: () {
                    if (otp.length == 6) {
                      RegisterOTPUtil.registerOTP(context, otp);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Please enter a 6-digit OTP.")),
                      );
                    }
                  }),
              SizedBox(
                height: _getSize.height * 0.03,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "By creating an account you agree to our ",
                    style: AppFonts.text14InterHint),
                TextSpan(
                    text: "Terms of Service", style: AppFonts.text14InterGreen),
                TextSpan(text: " and ", style: AppFonts.text14InterHint),
                TextSpan(
                    text: "Privacy Policy.", style: AppFonts.text14InterGreen),
              ])),
              SizedBox(
                height: _getSize.height * 0.03,
              ),
            ],
          ),
        ),
      )),
    );
  }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _timer.cancel();
    super.dispose();
  }
}
