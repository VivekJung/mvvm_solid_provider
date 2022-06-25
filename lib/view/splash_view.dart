import 'package:flutter/material.dart';
import 'package:mvm_solid_provider/view/services/splash_services.dart';

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
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}

// TweenAnimationBuilder<double>(
//               tween: Tween<double>(begin: 0.0, end: 1),
//               duration: const Duration(milliseconds: 2),
//               builder: (context, val, _) {
//                 return CircularProgressIndicator(
//                   value: val,
//                   color: Colors.deepOrange,
//                 );
//               })),