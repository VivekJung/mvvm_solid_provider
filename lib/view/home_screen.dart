import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    Color.fromARGB(255, 55, 134, 31).withOpacity(0.5),
                    Color.fromARGB(255, 80, 150, 40).withOpacity(0.7)
                  ]),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
          ],
        ),
        body: Container());
  }
}
