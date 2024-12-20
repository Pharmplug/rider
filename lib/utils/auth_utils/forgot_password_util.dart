import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_routes.dart';
import '../../provider/auth_provider.dart';
import '../app_utils.dart';
import '../local_storage.dart';

class ForgotPasswordUtil {
  static Future<void> forgotPassword(GlobalKey<FormState> formkey,
      BuildContext context, Map<String, dynamic> forgotData) async {
    var result;
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      AppUtils.showLoader(context);
      await saveEmail(forgotData['email']);

      Provider.of<AuthProvider>(context, listen: false)
          .forgotPassword(forgotData['email'].toString())
          .then((value) async {
        Navigator.of(context).pop();
        print(value);
        if (value['statusCode'] != 200) {
          AppUtils.errorDialog(
            context,
            "Something isn't right!",
            value['error'],
            'Close',
            Icon(
              Icons.error_rounded,
              color: Color.fromARGB(255, 213, 10, 27),
              size: 30,
            ),
          );
        } else {
          //TO DO
          await saveUserId(value['data']['userId']);
          await saveAccessToken(value['data']['token']);
          
          // IsFirstTime().once(2);
          Navigator.of(context).pushNamed(AppRoutes.resetotpScreen);
        }
      });
    }
  }
}
