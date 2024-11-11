import 'package:flutter/material.dart';
import 'package:pharmplug_rider/components/buttons.dart';
import 'package:pharmplug_rider/constants/app_colors.dart';
import 'package:pharmplug_rider/constants/app_images.dart';
import 'package:pharmplug_rider/constants/app_routes.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _getSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(),
          Image.asset(
            AppImages.logo,
            width: _getSize.width * 0.5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ButtonWithFunction(
                text: "Get Started",
                onPressed: () => {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoutes.loginScreen, (route) => false)
                    }),
          )
        ],
      )),
    );
  }
}
