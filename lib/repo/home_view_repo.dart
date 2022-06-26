import 'package:mvm_solid_provider/data/export_data_files.dart';
import 'package:mvm_solid_provider/model/movies_model.dart';
import 'package:mvm_solid_provider/res/app_urls.dart';

class HomeViewRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<MovieListModel> fetchMovieApi() async {
    try {
      dynamic response = await _apiServices.getApiResponse(AppUrl.movieListUrl);
      return response = MovieListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
