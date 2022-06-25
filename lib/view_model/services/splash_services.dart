import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvm_solid_provider/model/user_model.dart';
import 'package:mvm_solid_provider/utils/export_utils_files.dart';
import 'package:mvm_solid_provider/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    //This function gives all value that we get from user model
    getUserData().then((value) async {
      log('SPLASH SERVICE ${value.token}');
      if (value.token == null || value.token == '') {
        var pushNamedLogin = Navigator.pushNamed(context, RoutesName.login);
        await Future.delayed(const Duration(seconds: 2));
        pushNamedLogin;
      } else {
        var pushNamedHome = Navigator.pushNamed(context, RoutesName.home);
        await Future.delayed(const Duration(seconds: 2));
        pushNamedHome;
      }
    }).onError((error, stackTrace) {
      log('SPLASH SERVICES :: $error');
    });
  }
}
