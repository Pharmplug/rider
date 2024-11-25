import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../network/auth.dart';
import '../utils/local_storage.dart';

class AuthProvider extends ChangeNotifier {
  String? accessToken;
  // final Map<String, dynamic> serverErrorResult = {
  //   'status': false,
  //   'message': 'Sorry, something went wrong. Contact the Admin',
  // };

  Future<Map<String, dynamic>> login(email, password) async {
    dynamic data;
    //dynamic dataz;
    //List<dynamic> data;
    notifyListeners();

    try {
      var responseData = await AuthAPI.login(email, password);

      data = responseData;

      if (responseData['statusCode'] == 200) {
        data = responseData;
        notifyListeners();
        print(data);
        data;
      } else {
        data = responseData;
      }
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }

 Future<Map<String, dynamic>> registerOTP(String otp) async {
  dynamic data;

  try {
    // Ensure accessToken is available
    if (accessToken == null) {
      throw Exception("Access token is required");
    }
    var id = await showUserId();
    // Call OTPVerification API
    var responseData = await AuthAPI.OTPVerification(
      id:id,
      otp:otp,

    );

    if (responseData['statusCode'] == 200) {
      data = responseData; // Success response
      print("Success: $data");
    } else {
      data = responseData; // Error response
      print("Error: $data");
    }
  } catch (e) {
    data = {'error': e.toString()};
    print("Exception: $data");
  }

  return data;
}


  Future<Map<String, dynamic>> register(
      firstName, lastName, password, confirmPassword, email, phone) async {
    dynamic data;
    notifyListeners();

    try {
      var responseData = await AuthAPI.register(
          firstName, lastName, password, confirmPassword, email, phone);

      print(responseData);
      if (responseData['statusCode'] == 200) {
        notifyListeners();

        data = responseData;
        print(responseData);
      } else {
        data = responseData;
        print(responseData);
      }
    } catch (e) {
      notifyListeners();
      data = {'error': e};
      print(data);
    }
    return data;
  }

  Future<Map<String, dynamic>> forgotPassword(email) async {
    dynamic data;
    notifyListeners();

    try {
      var response = await AuthAPI.forgotPassword(email);

      if (response != null) {
        notifyListeners();
        print(response);
        data = response;
      }
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }

  Future<Map<String, dynamic>> changePassword(password) async {
    dynamic data;
    notifyListeners();
   
    var id = await showUserId();
    print(id);
    print(password);
    try {
      var response = await AuthAPI.resetPassword(id, password);
      var responseData = json.decode(response.body);
      if (responseData != null) {
        notifyListeners();

        data = responseData;
      }
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }

  Future<Map<String, dynamic>> fetchProfile(id, accessToken) async {
  dynamic data;

  try {
    // Call the API to fetch profile
    var responseData = await AuthAPI.getProfile(id, accessToken);

    print(responseData);
    if (responseData['statusCode'] == 200) {
      // Profile fetched successfully
      data = responseData;
    } else {
      // Handle error responses
      data = responseData;
    }
  } catch (e) {
    // Catch and handle any errors
    data = {'error': e.toString()};
  }

  return data;
}

}
