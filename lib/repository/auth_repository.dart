import 'package:nowaste_zindagi/data/network/BaseApiService.dart';
import 'package:nowaste_zindagi/res/app_url.dart';

import '../data/network/NetworkApiService.dart';

class AuthRepository{
BaseApiService _apiService = NetworkApiService();

Future<dynamic> loginApi( dynamic data) async {
  try {
    dynamic response = await _apiService.getPostApiResponse(
        AppUrl.loginUrl, data);
    return response;
  } catch (e) {
    throw e;
  }
}

Future<dynamic> registerApi( dynamic data) async {
  try {
    dynamic response = await _apiService.getPostApiResponse(
        AppUrl.registerUrl, data);
    return response;
  } catch (e) {
    throw e;
  }
}

}