import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



import '../../provider/auth_provider.dart';
import '../app_utils.dart';


class LoginUtil {
  login(GlobalKey<FormState> formkey, BuildContext context,
      Map<String, dynamic> loginData) async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();

     // AppUtils.showLoader(context);
      Provider.of<AuthProvider>(context, listen: false)
          .login(
        loginData['email'].trim(),
        loginData['password'].trim(),
      )
          .then((value) async {
        Navigator.of(context).pop();

    
      });
    }
  }
}
