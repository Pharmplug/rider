import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/app_routes.dart';
import '../../provider/auth_provider.dart';
import '../../views/dashboard/dashboard.dart';
import '../../views/navbar/nav.dart';
import '../app_utils.dart';
import '../local_storage.dart';

class LoginUtil {
  static Future<void> login(GlobalKey<FormState> formkey, BuildContext context,
      Map<String, dynamic> loginData) async {
    print(loginData);
    //var token2 = await showToken();
    //var id2 = await showId();

    // var result;
    await saveEmail(loginData['email']);

    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();

      AppUtils.showLoader(context);
      Provider.of<AuthProvider>(context, listen: false)
          .login(
        loginData['email'].trim(),
        loginData['password'].trim(),
      )
          .then((value) async {
        print(value);
        Navigator.of(context).pop();

        if (value['statusCode'] == 200) {
          print("yes ${value}");
          // formkey.currentState!.reset();
          await saveUserId(value['data']['rider']['id'].toString());
          await saveEmail(value['data']['rider']['email']);
          await saveName(value['data']['rider']['firstName']);
          await savePhone(value['data']['rider']['phone']);
          await saveSurName(value['data']['rider']['lastName']);
          await saveCreatedAt(value['data']['rider']['createdAt']);
          await saveStatus(value['data']['rider']['status']);
          await saveAccessToken(value['data']['token']);
          await saveIsWorking(value['data']['rider']['isWorking']);
          await saveBalance(value['data']['rider']['balance']?? "0");
          await savePhoto(value['data']['rider']['photo']);
           await saveOnce(3);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => NavBar(
                      initialScreen: const Dashboard(),
                      initialTab: 0,
                    )),
            (route) => false,
          );
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

          if (value['statusCode'] == 302 && value['data']['status'] == false) {
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

    // return result;
  }
}
