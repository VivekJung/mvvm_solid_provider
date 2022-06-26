import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvm_solid_provider/data/export_data_files.dart';
import 'package:mvm_solid_provider/model/movies_model.dart';
import 'package:mvm_solid_provider/repo/home_view_repo.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeViewRepository();

  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MovieListModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMovieListApi() async {
    setMoviesList(ApiResponse.loading());
    _myRepo.fetchMovieApi().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      log('FETCHMOVIELISTAPI ERROR::$error');
    });
  }
}
