import 'package:dsa/res/api_urls/api_urls.dart';

import '../../data/network/network_api_services.dart';

class CheckCibilScoreRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> checkCibilScore(
      Map<String, dynamic> data, String token) async {
    return await _apiServices.postApi(data, ApiUrls.fetchCibiScoreApi,
        token: token);
  }
}
