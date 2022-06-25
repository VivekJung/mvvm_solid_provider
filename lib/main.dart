import 'package:flutter/material.dart';
import 'package:mvm_solid_provider/utils/routes/routes.dart';
import 'package:mvm_solid_provider/utils/routes/routes_name.dart';

import 'package:mvm_solid_provider/view_model/auth_view_model.dart';
import 'package:mvm_solid_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MVVM-SOLID-PROVIDER',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
