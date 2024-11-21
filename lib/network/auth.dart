import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constants/resources.dart';

class AuthAPI {

  static Future OTPVerfication(id, otp) async {
    var response = await http.put(
      Uri.parse('$baseURL/users/verify-otp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"id": id, "otpData": otp}),
    );

    var parsedResponse = jsonDecode(response.body);

    return parsedResponse;
  }

  static Future register(
      firstName, lastName, password, confirmPassword, email, phone) async {
    var payload = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phone": phone,
      "password": password,
      "confirmPassword": confirmPassword
    };
    print(payload);
    var response = await http.post(
      Uri.parse('$baseURL/users/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(payload),
    );
    var parsedResponse = jsonDecode(response.body);

    return parsedResponse;
  }

  static Future login(data, password) async {
    print(data);
    print(password);
    var response = await http.post(
      Uri.parse('$baseURL/users/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"data": data.toString(), "password": password}),
    );

    var parsedResponse = jsonDecode(response.body);

    return parsedResponse;
  }

  static Future forgotPassword(email) async {
    var response = await http.post(
        Uri.parse('$baseURL/users/forgot-password'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"email": email}),
      );

      var parsedResponse = jsonDecode(response.body);
      print(parsedResponse);
      return parsedResponse;
  }

  static Future resetPassword(id, password) async {
    var response = await http.patch(
      Uri.parse('$baseURL/users/password-reset'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"id": id, "password": password}),
    );

    var parsedResponse = response;

    return parsedResponse;
  }

  // Fetch User Profile
  static Future getProfile(id, accessToken) async {
    try {
      final response = await http.get(
        Uri.parse('$baseURL/users/$id/profile'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        var parsedResponse = jsonDecode(response.body);
        return parsedResponse;
      } else {
        throw Exception('Failed to fetch profile: ${response.body}');
      }
    } catch (e) {
      print('Error fetching profile: $e');
      rethrow;
    }
  }

  // Update User Profile
  // static Future updateProfile(String userId, Map<String, String> updatedData, String accessToken) async {
  //   try {
  //     final response = await http.put(
  //       Uri.parse('$baseURL/users/$userId/profile'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Authorization': 'Bearer $accessToken', 
  //       },
  //       body: jsonEncode(updatedData),
  //     );

  //     if (response.statusCode == 200) {
  //       var parsedResponse = jsonDecode(response.body);
  //       return parsedResponse;
  //     } else {
  //       throw Exception('Failed to update profile: ${response.body}');
  //     }
  //   } catch (e) {
  //     print('Error updating profile: $e');
  //     rethrow;
  //   }
  // }

}
