import 'dart:async';


import 'package:flutter/widgets.dart';

import '../network/rider.dart';


class RequestProvider extends ChangeNotifier {

  Future<Map<String, dynamic>> allRiderRequest() async {
    dynamic data;
    //dynamic dataz;
    //List<dynamic> data;
    notifyListeners();

    try {
      var responseData = await RiderAPI.riderRequests();

      data = responseData;

      if (responseData['statusCode'] == 200) {
        notifyListeners();
        print(data);
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
