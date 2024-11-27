import 'package:flutter/material.dart';
import 'package:pharmplug_rider/utils/local_storage.dart';
import 'package:provider/provider.dart';
import '../../constants/app_routes.dart';
import '../provider/auth_provider.dart';
import '../utils/app_utils.dart';

class ProfileUtil {
  static Future<Map<String, dynamic>> fetchProfile(BuildContext context,  Map<String, dynamic> id, accessToken) async {
    AppUtils.showLoader(context);
    final result = await Provider.of<AuthProvider>(context, listen: false).fetchProfile(id, accessToken);
    Navigator.of(context).pop();
    await saveName(['name']);

    if (result['statusCode'] == 200) {
      return result['data'];
    } else {
      AppUtils.showAlertDialog(
        context,
        'Error',
        result['error'] ?? 'Unable to fetch profile. Please try again.',
        'Close',
        '',
        () {
          Navigator.of(context).pushNamed(AppRoutes.loginScreen);
        },
      );
      return {};
    }
  }

  // static Future<void> updateProfile(BuildContext context, Map<String, dynamic> profileData) async {
  //   AppUtils.showLoader(context);
  //   final result = await Provider.of<AuthProvider>(context, listen: false).updateProfile(profileData);
  //   Navigator.of(context).pop();

  //   if (result['statusCode'] == 200) {
  //     AppUtils.showSnackbar(context, 'Profile updated successfully!');
  //   } else {
  //     AppUtils.showAlertDialog(
  //       context,
  //       'Error',
  //       result['error'] ?? 'Unable to update profile. Please try again.',
  //       'Close',
  //       '',
  //       null,
  //     );
  //   }
  // }
}

