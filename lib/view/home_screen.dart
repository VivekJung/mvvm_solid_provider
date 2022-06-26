import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvm_solid_provider/data/export_data_files.dart';
import 'package:mvm_solid_provider/model/movies_model.dart';
import 'package:mvm_solid_provider/res/components/simple_text.dart';
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
        backgroundColor: Colors.blue,
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
          Container(
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(width: 2.0, color: Colors.white),
              ),
            ),
            child: IconButton(
                onPressed: () {
                  userPref.removeUserCachedData().then((value) {
                    Navigator.popAndPushNamed(context, RoutesName.splash);
                  });
                },
                icon: const Icon(Icons.logout_sharp)),
          )
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
                child: Text(' ${value.moviesList.message}'),
              );

            case Status.completed:
              int listLength = value.moviesList.data!.movies!.length;
              return Container(
                color: Colors.green.shade400,
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Card(child: SimpleText(text: '$listLength')),
                    Expanded(
                      child: ListView.builder(
                          controller: ScrollController(),
                          itemCount: listLength,
                          itemBuilder: ((context, index) {
                            Movies movie =
                                value.moviesList.data!.movies![index];
                            return Card(
                              child: ListTile(
                                title: Text(movie.title.toString()),
                                subtitle: Text(movie.year.toString()),
                                leading: imageInCircle(movie),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    //we are now using function/formula to get ratings'avg
                                    Text(Utils.avgRating(movie.ratings!)
                                        .toStringAsFixed(1)),
                                    const Icon(Icons.star,
                                        color: Colors.amberAccent)
                                  ],
                                ),
                              ),
                            );
                          })),
                    ),
                  ],
                ),
              );
            default:
              return Container();
          }
        }),
      ),
    );
  }

  imageInCircle(Movies movie) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Colors.red.shade400),
      child: ClipOval(
        child: Image.network(
          movie.posterurl.toString(),
          height: 40,
          width: 40,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.error,
              color: Colors.white,
              size: 30,
            );
          },
        ),
      ),
    );
  }
}
