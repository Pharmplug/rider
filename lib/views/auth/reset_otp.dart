import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../components/buttons.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_font.dart';
import '../../constants/app_images.dart';
import '../../constants/app_routes.dart';

class ResetOTP extends StatefulWidget {
  const ResetOTP({Key? key}) : super(key: key);

  @override
  State<ResetOTP> createState() => _ResetOTPState();
}

class _ResetOTPState extends State<ResetOTP> {
  var time = "03:07";
  var otp = "";
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
                    TextSpan(
                        text: "ayoseunsolomon@gmail.com",
                        style: AppFonts.text14InterGreen),
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
                            time,
                            style: AppFonts.text14InterGreen
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        "Resend",
                        style: AppFonts.text14InterGreen.copyWith(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: Pallete.secondaryColor),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: _getSize.height * 0.1,
              ),
              OTPTextField(
                  length: 5,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 45,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 10,
                  style:AppFonts.text14Inter,
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
                    Navigator.of(context).pushNamed(
                        AppRoutes.resetScreen);
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
}
