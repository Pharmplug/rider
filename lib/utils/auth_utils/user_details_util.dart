import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/app_routes.dart';
import '../../provider/auth_provider.dart';
import '../../views/dashboard/dashboard.dart';
import '../../views/navbar/nav.dart';
import '../app_utils.dart';
import '../local_storage.dart';

class UserDetailsUtil {
  static Future<void> userDetails(GlobalKey<FormState> formkey,
      BuildContext context, Map<dynamic, dynamic> userData) async {
    print(userData);

    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();

      AppUtils.showLoader(context);
      Provider.of<AuthProvider>(context, listen: false)
          .register(
              userData['firstName'].trim(),
              userData['lastName'].trim(),
              userData['password'].trim(),
              userData['confirmPassword'].trim(),
              userData['email'].trim(),
              userData['phone'].trim())
          .then((value) async {
        print(value);
        Navigator.of(context).pop();

        if (value['statusCode'] == 200) {
          print("yes ${value}");
          // formkey.currentState!.reset();
          await saveUserId(value['data']['customercode'].toString());

          await saveAccessToken(value['data']['token']);

          Navigator.of(context).pushNamed(AppRoutes.registerotpScreen);
        } else {
          if (value['statusCode'] == 404) {
            AppUtils.showAlertDialog(
                context,
                'Oops, something isn\'t right!',
                value['data'],
                'Sign Up',
                'Try again',
                () =>
                    Navigator.of(context).pushNamed(AppRoutes.registerScreen));
          }
          if (value['statusCode'] == 403) {
            AppUtils.showAlertDialog(
                context,
                'Oops, something isn\'t right!',
                value['error'],
                'Enter OTP',
                'Close',
                () => Navigator.of(context)
                    .pushNamed(AppRoutes.registerotpScreen));
          }

          if (value['statusCode'] == 302) {
            AppUtils.showAlertDialog(
                context,
                'Oops, something isn\'t right!',
                value['data'],
                'Contact Support',
                'Close',
                () =>
                    Navigator.of(context).pushNamed(AppRoutes.registerScreen));
          }
        }
      });
    }
  }
}
