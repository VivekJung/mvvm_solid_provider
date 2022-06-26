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
    super.initState();
    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: SimpleText(
              text: "SPLASH SCREEN",
              fontWeight: FontWeight.w300,
              txtColor: Colors.green,
              txtSize: 36,
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width - 40,
              child: const Image(
                image: AssetImage('assets/gifs/shiv.gif'),
                fit: BoxFit.cover,
              ))
        ],
      ),
    );
  }
}

// 