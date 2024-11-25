import 'package:flutter/material.dart';
import 'package:pharmplug_rider/utils/local_storage.dart';
import 'package:pharmplug_rider/views/auth/reset_password.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../../views/navbar/nav.dart';
import '../app_utils.dart';

class ResetOTPUtil {
  static Future<void> registerOTP(BuildContext context, String otp) async {
    AppUtils.showLoader(context);
    try {
      Provider.of<AuthProvider>(context, listen: false)
          .registerOTP(otp)
          .then((value) async {
        if (value["statusCode"] == 200) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => NavBar(
                      initialScreen: const ResetPassword(),
                      initialTab: 0,
                    )),
            (route) => false,
          );
          saveOnce(3);
        } else {}
      });
    } catch (e) {
      print(e);
    }
  }
}
