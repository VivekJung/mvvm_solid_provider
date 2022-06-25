import 'package:flutter/material.dart';
import 'package:mvm_solid_provider/res/components/simple_text.dart';
import 'package:mvm_solid_provider/view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    splashServices.checkAuthentication(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: SimpleText(
              text: "SPLASH SCREEN",
              fontWeight: FontWeight.w300,
              txtColor: Colors.green,
              txtSize: 36,
            ),
          ),
          // Center(
          //   child: CircularProgressIndicator(
          //     color: Colors.green,
          //   ),
          // ),
        ],
      ),
    );
  }
}

// 