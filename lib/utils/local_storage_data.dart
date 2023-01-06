// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'package:get/get.dart';
import 'package:getx/constant/constance.dart';
import 'package:getx/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController {
  Future<UserModel> get getUser async {
    try {
      UserModel userModel = await _getUserData();
      if (userModel == null) {}
      return userModel;
    } catch (e) {
      print(e.toString());
      return UserModel();
    }
  }

  _getUserData() async {
    SharedPreferences prefs  = await SharedPreferences.getInstance();
    var value = prefs .getString(CACHED_USER_DATA);
    return UserModel.fromjson(json.decode(value!));
  }

  setUser(UserModel userModel) async {
    SharedPreferences prefs  = await SharedPreferences.getInstance();
    await prefs .setString(
        CACHED_USER_DATA, json.encode(userModel.toJson()));
  }

  void deleteUser() async {
    SharedPreferences prefs  = await SharedPreferences.getInstance();
    await prefs .clear();
  }
}
