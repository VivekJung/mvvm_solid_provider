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
      log(value.toString());
      if (value.token == null || value.token == '') {
        Future.delayed(const Duration(seconds: 2));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        Future.delayed(const Duration(seconds: 2));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      log('SPLASH SERVICES :: $error');
    });
  }
}
