import 'package:mvm_solid_provider/data/network/baseApi.dart';
import 'package:mvm_solid_provider/data/network/network_api_services.dart';
import 'package:mvm_solid_provider/res/app_urls.dart';

class AuthRepository {
  //we are managing APIs here
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registerUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
