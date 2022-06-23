import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvm_solid_provider/repo/auth_repository.dart';
import 'package:mvm_solid_provider/utils/routes/routes_name.dart';
import 'package:mvm_solid_provider/utils/utilities.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

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
      Utils.flushBarErrorMessage('Success login', context);
      Navigator.pushNamed(context, RoutesName.home);
      log(value.toString());
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage('$error', context);
      log(error.toString());
    });
  }
}
