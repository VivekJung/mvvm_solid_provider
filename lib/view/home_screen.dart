import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvm_solid_provider/data/export_data_files.dart';
import 'package:mvm_solid_provider/utils/export_utils_files.dart';
import 'package:mvm_solid_provider/view_model/home_viewview_model.dart';
import 'package:mvm_solid_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    //if you don't want to initialize in the main then you can initialize this here.
    homeViewViewModel.fetchMovieListApi();
    super.initState();
  }

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
                  Navigator.popAndPushNamed(context, RoutesName.splash);
                });
              },
              icon: const Icon(Icons.logout_sharp))
        ],
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(builder: (context, value, child) {
          switch (value.moviesList.status) {
            case Status.loading:
              return const Center(child: CircularProgressIndicator());

            case Status.error:
              return Center(
                child: Text(
                    'Error while loading :: Switch case :: homeview :: ${value.moviesList.message}'),
              );

            case Status.completed:
              return const Center(
                  child: Text('loading complete, here will be your data'));
            default:
              return Container();
          }
        }),
      ),
    );
  }
}
