import 'package:flutter/material.dart';
import 'package:pharmplug_rider/models/recent_deliveries.dart';
import 'package:pharmplug_rider/views/auth/profile_details.dart';
import 'package:pharmplug_rider/views/onboarding/onboading.dart';
import 'package:pharmplug_rider/views/onboarding/onboarding2.dart';
import 'package:pharmplug_rider/views/onboarding/onboarding3.dart';
import 'package:pharmplug_rider/views/profile/edit_profile.dart';

import '../views/auth/forgot_password.dart';
import '../views/auth/login.dart';
import '../views/auth/register.dart';
import '../views/auth/register_otp.dart';
import '../views/auth/reset_otp.dart';
import '../views/auth/reset_password.dart';
import '../views/dashboard/dashboard.dart';
import '../views/order/order.dart';

class AppRoutes {
  static const dashboardScreen = '/dashboardScreen';

  static const registerScreen = '/registerScreen';
  static const registerotpScreen = '/registerotpScreen';
  static const resetotpScreen = '/resetotpScreen';
  static const resetScreen = '/resetScreen';
  static const loginScreen = '/loginScreen';
  static const forgotPassword = '/forgotPassword';
  static const profileDetails = '/profileDetails';
  static const editProfile = '/editProfile';
  static const onboarding = '/onboarding';
  static const onboarding2 = '/onboarding2';
  static const onboarding3 = '/onboarding3';
  static const order = '/order';



  static Map<String, WidgetBuilder> routes() {
    return <String, WidgetBuilder>{
      AppRoutes.dashboardScreen: ((context) => const Dashboard()),
      AppRoutes.forgotPassword: ((context) => const ForgotPassword()),
      AppRoutes.registerScreen: ((context) => const Register()),
      AppRoutes.registerotpScreen: ((context) => const RegisterOTP()),
      AppRoutes.resetScreen: ((context) => const ResetPassword()),
      AppRoutes.resetotpScreen: ((context) => const ResetOTP()),
      AppRoutes.loginScreen: ((context) => const Login()),
      AppRoutes.profileDetails: ((context) => const ProfileDetails()),
      AppRoutes.editProfile: ((context) => const EditProfile()),
      AppRoutes.onboarding: ((context) => const Onboarding()),
      AppRoutes.onboarding2: ((context) => const Onboarding2()),
      AppRoutes.onboarding3: ((context) => const Onboarding3()),
      AppRoutes.order: ((context) => const OrderScreen()),

    };
  }
}
