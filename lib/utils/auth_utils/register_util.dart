import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pharmplug_rider/utils/local_storage.dart';


import '../../constants/app_routes.dart';


class RegisterUtil {
  static Future<String> register(GlobalKey<FormState> formkey,
      BuildContext context, Map<String, dynamic> registerData) async {

    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      saveEmail(registerData["email"]);
      print(registerData);
      Navigator.of(context).pushNamed(
        AppRoutes.profileDetails,
        arguments: registerData,
      );
    }else{

    }
    return "";
  }

  
}
