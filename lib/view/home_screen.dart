import 'package:flutter/material.dart';
import 'package:mvm_solid_provider/utils/export_utils_files.dart';
import 'package:mvm_solid_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userPref = Provider.of<UserViewModel>(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Home screen'),
          elevation: 0,
          // this need to be set
          backgroundColor: Colors.transparent,
          // create gradient background color
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    const Color.fromARGB(255, 80, 150, 40).withOpacity(0.7),
                    const Color.fromARGB(255, 55, 134, 31).withOpacity(0.5),
                    const Color.fromARGB(255, 80, 150, 40).withOpacity(0.7)
                  ]),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  userPref.removeUserCachedData().then((value) {
                    Navigator.pushNamed(context, RoutesName.splash);
                  });
                },
                icon: const Icon(Icons.logout_sharp))
          ],
        ),
        body: Container());
  }
}
