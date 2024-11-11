import 'dart:async';

import 'package:flutter/widgets.dart';




class AuthProvider extends ChangeNotifier {
  Future<Map<String, dynamic>> login(email, password) async {
    dynamic data;
    //dynamic dataz;
    //List<dynamic> data;
    notifyListeners();

    try {
      var responseData; //await AuthAPI.login(email, password);

      data = responseData;

      if (responseData['statusCode'] == 200) {
        notifyListeners();
       
        data;
      } else {
        data;
      }
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }

}