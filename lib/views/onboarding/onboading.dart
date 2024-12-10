import 'package:flutter/material.dart';
import 'package:pharmplug_rider/constants/app_colors.dart';
import 'package:pharmplug_rider/constants/app_font.dart';
import 'package:pharmplug_rider/constants/app_images.dart';
import 'package:pharmplug_rider/constants/app_routes.dart';
import 'package:pharmplug_rider/utils/local_storage.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      "title": "Get Ready To Deliver",
      "body": "Enable your availability, accept orders, and start delivering with ease.",
      "image": AppImages.onboarding1,
      "tracking": AppImages.onboadingSequence,

    },
    {
      "title": "Track and Update Your Journey",
      "body": "“Enable GPS tracking, keep customers informed, and navigate with confidence.”.",
      "image": AppImages.onboarding2,
      "tracking": AppImages.onboadingSequence2,

    },
    {
      "title": "Complete Deliveries Effortlessly",
      "body": "“Update your status, confirm deliveries, and prepare for your next order.”.",
      "image": AppImages.onboarding3,
      "tracking": AppImages.completeSequence,

    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _navigateToLogin() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.loginScreen,
      (route) => false,
    );
    saveOnce(1);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          page["image"]!,
                          height: size.height / 2.5,
                        ),
                        if (page["tracking"] != null) 
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30.0),
                          child: Image.asset(
                            page["tracking"]!,
                            width: size.width * 0.18, 
                          ),
                        ),
                        Text(
                          page["title"]!,
                          style: AppFonts.text16Barlow.copyWith(
                            color: Pallete.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Text(
                            page["body"]!,
                            textAlign: TextAlign.center,
                            style: AppFonts.text14Barlow.copyWith(
                              color: Pallete.hintText,fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: _navigateToLogin,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Pallete.secondaryColor,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Skip",
                        style: AppFonts.text16Barlow.copyWith(
                          color: Pallete.secondaryColor,fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_currentPage == _pages.length - 1) {
                        _navigateToLogin();
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 25),
                      decoration: BoxDecoration(
                        color: Pallete.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        _currentPage == _pages.length - 1 ? "Get Started" : "Next",
                        style: AppFonts.text16Barlow.copyWith(
                          color: Pallete.whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
