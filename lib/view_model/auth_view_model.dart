import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvm_solid_provider/model/user_model.dart';
import 'package:mvm_solid_provider/repo/auth_repository.dart';
import 'package:mvm_solid_provider/utils/routes/routes_name.dart';
import 'package:mvm_solid_provider/utils/utilities.dart';
import 'package:mvm_solid_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

//login
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      // saving usertoken with provider.. listen is false! coz we don't need to rebuild the widget here.
      final userPreferences =
          Provider.of<UserViewModel>(context, listen: false);
      userPreferences.saveUserToken(
        UserModel(token: value['token'].toString()),
      );
      //
      Utils.flushBarErrorMessage('Success login', context, null);

      Navigator.pushNamed(context, RoutesName.splash);
      log('LOGIN API:: $value');
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage('$error', context, null);
      log('Error in LOGINAPI:: $error');
    });
  }

  //signup
  bool _isLoadingSignUp = false;
  bool get isLoadingSignUp => _isLoadingSignUp;

  setSignUpLoading(bool val) {
    _isLoadingSignUp = val;
    notifyListeners();
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);

    _myRepo.signUpApi(data).then((value) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(
          'Successfully signed-up', context, Colors.green);
      Navigator.pushNamed(context, RoutesName.home);
      log(value.toString());
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage('$error', context, null);
      log(error.toString());
    });
  }
}
