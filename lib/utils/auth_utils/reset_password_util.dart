import 'package:flutter/material.dart';
import 'package:pharmplug_rider/constants/app_routes.dart';
import 'package:pharmplug_rider/views/auth/login.dart';
import 'package:pharmplug_rider/views/navbar/nav.dart';
import 'package:provider/provider.dart';
import '../local_storage.dart';
import '../../provider/auth_provider.dart';
import '../app_utils.dart';
import '../../constants/app_routes.dart';


class ResetPasswordUtil {
  static Future<void> resetPassword(
    GlobalKey<FormState> formkey,
    BuildContext context,
   Map<String, dynamic> resetData)  async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      AppUtils.showLoader(context);
      // await saveUserId(resetData['id']);

    //danielakinlolu55@gmail.com
      try {
      Provider.of<AuthProvider>(context, listen: false)
          .changePassword(resetData['password'])
          .then((value) async {
            print(value);
        if (value["statusCode"] == 200) {
           Navigator.of(context).pushNamed(AppRoutes.loginScreen);
          saveOnce(3);
        } else {
          if(value["statusCode"] == 404){
           AppUtils.showAlertDialog(
            context,
            "Something isn't right!",
            value['error'],
            'Close',
            'Try again',
            ()=>{}
          );
          }
        }
      });
    } catch (e) {
      print(e);
    }
    }
  }
}
