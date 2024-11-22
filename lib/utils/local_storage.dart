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
  sPrefs.setBool("phrider-status", status);
}
saveAccessToken(token) async {
  sPrefs = await SharedPreferences.getInstance();
  sPrefs.setString("phrider-accessToken",token);
}
saveOnce(once) async {
  sPrefs = await SharedPreferences.getInstance();

  sPrefs.setInt("phrider-Once", once);

}
showName() async {
  sPrefs = await SharedPreferences.getInstance();
  String? temp=  sPrefs.getString("phrider-name");
    return temp;
}

showSurName() async {
  sPrefs = await SharedPreferences.getInstance();
  String? temp=  sPrefs.getString("phrider-surname");
   return temp;
}

showPhone() async {
  sPrefs = await SharedPreferences.getInstance();
  String? temp=  sPrefs.getString("phrider-phone");
   return temp;
}

showEmail() async {
  sPrefs = await SharedPreferences.getInstance();
 String? temp= sPrefs.getString("phrider-email");
   return temp;
}

showAccessToken() async {
  sPrefs = await SharedPreferences.getInstance();
 String? temp= sPrefs.getString("phrider-accessToken");
   return temp;
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

showStatus() async {
  sPrefs = await SharedPreferences.getInstance();
  bool? temp = sPrefs.getBool("phrider-status");
    return temp;
}
clearData() async {
  sPrefs = await SharedPreferences.getInstance();
  sPrefs.clear();
}
