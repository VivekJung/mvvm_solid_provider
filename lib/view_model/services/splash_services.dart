import 'dart:async';
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
      log('SPLASH SERVICE :: token value:: ${value.token}');

      if (value.token.toString() == '' || value.token == null) {
        //calling screen after delay using Timer class
        Timer(const Duration(seconds: 2), () {
          Navigator.popAndPushNamed(context, RoutesName.login);
        });
      } else {
        //calling screen after delay using future.delayed class
        await Future.delayed(const Duration(seconds: 2), () {
          Navigator.popAndPushNamed(context, RoutesName.home);
        });
      }
    }).onError((error, stackTrace) {
      log('SPLASH SERVICES :: error :: $error');
    });
  }
}
