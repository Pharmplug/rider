import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharmplug_rider/utils/local_storage.dart';

import '../constants/resources.dart';

class RiderAPI {
  static Future riderRequests() async {
    var accessToken = await showAccessToken();
    var id = await showUserId();
    var response = await http.get(
      Uri.parse('$baseURL/api/requests/all-rider-requests/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
    );
    var parsedResponse = jsonDecode(response.body);
    return parsedResponse;
  }

  static Future updateWork(status) async {
    var accessToken = await showAccessToken();
    var id = await showUserId();
    var response = await http.patch(
      Uri.parse('$baseURL/api/riders/work-status/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(<String, bool>{"isWorking": status}),
    );

    var parsedResponse = jsonDecode(response.body);
print(parsedResponse);
    return parsedResponse;
  }
}
