import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
late SharedPreferences sPrefs;

showOnce() async {
  sPrefs = await SharedPreferences.getInstance();

  int? temp = sPrefs.getInt("Once");

  temp ??= 0;

  return temp;
}