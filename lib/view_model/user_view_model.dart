import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvm_solid_provider/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUserToken(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    // put key as what you want to store and value will be comin from user model.
    var token = sp.setString('token', user.token.toString());
    log("saveuser ::$token");
    notifyListeners(); // whenever this function is called, changes will be notified.

    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    //make sure the key (here 'token') must be same as above.
    final String? token = sp.getString('token');
    log("GETUSER ::$token");
    return UserModel(token: token);
  }

  Future<bool> removeUserCachedData() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true; // gives true once preference for app is cleared.
  }
}
