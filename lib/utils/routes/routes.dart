import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvm_solid_provider/utils/routes/routes_name.dart';
import 'package:mvm_solid_provider/view/home_screen.dart';
import 'package:mvm_solid_provider/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    // log(args.toString());
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No routes defined'),
            ),
          );
        });
    }
  }
}
