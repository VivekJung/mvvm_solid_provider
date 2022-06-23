import 'package:flutter/material.dart';
import 'package:mvm_solid_provider/utils/routes/routes_name.dart';
import 'package:mvm_solid_provider/utils/utilities.dart';

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
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          IconButton(
              onPressed: () {
                // Utils.toastMessage('No internet connection');
                Utils.flushBarErrorMessage('No internet', context);
                // Utils.snackBar('No internet', context);
              },
              icon: const Icon(Icons.ads_click)),
        ],
      ),
    );
  }
}
