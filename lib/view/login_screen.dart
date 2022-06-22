import 'package:flutter/material.dart';
import 'package:mvm_solid_provider/utils/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.home);
              },
              icon: Icon(Icons.ads_click)),
          IconButton(onPressed: () {}, icon: Icon(Icons.cloud_circle)),
        ],
      ),
    );
  }
}
