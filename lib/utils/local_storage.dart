import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
late SharedPreferences sPrefs;


saveName(name) async {
  sPrefs = await SharedPreferences.getInstance();
  sPrefs.setString("phrider-name", name);
}

saveSurName(surname) async {
  sPrefs = await SharedPreferences.getInstance();
  sPrefs.setString("phrider-surname", surname);
}
savePhone(phone) async {
  sPrefs = await SharedPreferences.getInstance();
  sPrefs.setString("phrider-phone", phone);
}
saveRef(ref) async {
  sPrefs = await SharedPreferences.getInstance();
  sPrefs.setString("phrider-ref", ref);
}

saveUserId(id) async {
  sPrefs = await SharedPreferences.getInstance();
  sPrefs.setString("phrider-id", id);
}
saveEmail(email) async {
  sPrefs = await SharedPreferences.getInstance();
  sPrefs.setString("phrider-email", email);
}
saveStatus(status) async {
  sPrefs = await SharedPreferences.getInstance();
  sPrefs.setString("phrider-status", status);
}

saveOnce(once) async {
  sPrefs = await SharedPreferences.getInstance();


  sPrefs.setInt("phrider-Once",once);
}

showOnce() async {
  sPrefs = await SharedPreferences.getInstance();

  int? temp = sPrefs.getInt("phrider-Once");

  temp ??= 0;

  return temp;
}

showUserId() async {
  sPrefs = await SharedPreferences.getInstance();

  String? temp = sPrefs.getString("phrider-id");

  return temp;
}