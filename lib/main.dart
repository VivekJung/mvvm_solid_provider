import 'package:flutter/material.dart';
import 'package:mvm_solid_provider/utils/routes/routes.dart';
import 'package:mvm_solid_provider/utils/routes/routes_name.dart';
import 'package:mvm_solid_provider/view/login_screen.dart';
import 'package:mvm_solid_provider/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVVM-SOLID-PROVIDER',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
