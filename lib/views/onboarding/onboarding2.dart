// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pharmplug_rider/constants/app_colors.dart';
import 'package:pharmplug_rider/constants/app_font.dart';
import 'package:pharmplug_rider/constants/app_images.dart';
import 'package:pharmplug_rider/components/buttons.dart';
import 'package:pharmplug_rider/constants/app_routes.dart';
import 'package:pharmplug_rider/utils/local_storage.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  State<Onboarding2> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding2> {
  @override
  Widget build(BuildContext context) {
    final _getSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30),
          child: Column(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Pallete.onboardColor,
                  )),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                AppImages.onboadingSequence2,
              ),
              SizedBox(
                height: 30,
              ),
              Text('Track and Update Your Journey',
                  style: AppFonts.text16Barlow.copyWith(
                      color: Pallete.black, fontWeight: FontWeight.w600)),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                    '“Enable GPS tracking, keep customers informed, and navigate with confidence.”',
                    textAlign: TextAlign.center,
                    style: AppFonts.text14Barlow
                        .copyWith(color: Pallete.hintText)),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   GestureDetector(
                      onTap: (){Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoutes.onboarding3, (route) => false);
                            saveOnce(1);
                            },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Pallete.secondaryColor, width: 1.5),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                        child: Text(
                          'Skip',
                          style: AppFonts.text16Barlow
                              .copyWith(color: Pallete.secondaryColor),
                        ),
                      ),
                    ),
                     GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoutes.loginScreen, (route) => false);
                            saveOnce(1);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Pallete.primaryColor),
                        child: Text(
                          'Get Started',
                          style: AppFonts.text16Barlow.copyWith(
                              color: Pallete.whiteColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
