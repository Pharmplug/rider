import 'package:flutter/material.dart';
import 'package:pharmplug_rider/views/auth/profile_details.dart';

import '../views/auth/forgot_password.dart';
import '../views/auth/login.dart';
import '../views/auth/register.dart';
import '../views/auth/register_otp.dart';
import '../views/auth/reset_otp.dart';
import '../views/auth/reset_password.dart';
import '../views/dashboard/dashboard.dart';

class AppRoutes {
  static const dashboardScreen = '/dashboardScreen';

  static const registerScreen = '/registerScreen';
  static const registerotpScreen = '/registerotpScreen';
  static const resetotpScreen = '/resetotpScreen';
  static const resetScreen = '/resetScreen';
  static const loginScreen = '/loginScreen';
  static const forgotPassword = '/forgotPassword';
  static const profileDetails = '/profileDetails';
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
    };
  }
}
